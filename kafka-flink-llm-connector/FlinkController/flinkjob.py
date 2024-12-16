
from pyflink.datastream import StreamExecutionEnvironment
from pyflink.datastream.execution_mode import RuntimeExecutionMode
from pyflink.common.watermark_strategy import WatermarkStrategy
from py4j.java_gateway import JavaObject, get_java_class
from pyflink.common import Types
from pyflink.common.types import Row
from pyflink.datastream.functions import MapFunction
import json
from pyflink.common import DeserializationSchema, TypeInformation, typeinfo, SerializationSchema
from pyflink.datastream.connectors.kafka import KafkaSource,KafkaSink,KafkaRecordSerializationSchema,KafkaOffsetsInitializer
from pyflink.common.serialization import SimpleStringSchema
from pyflink.datastream.formats.json import JsonRowDeserializationSchema,JsonRowSerializationSchema
#######

from dbflink import BatchDatabaseUser


from datetime import datetime
import time

import os
from dotenv import load_dotenv
from langchain_core.prompts import ChatPromptTemplate
from langchain_groq import ChatGroq
from pydantic import BaseModel, Field
# Carica il file .env

# Recupera la variabile di ambiente

load_dotenv()
GROQ_API_KEY = os.getenv('PYTHON_PROGRAM_KEY')
time.sleep(11)


####################################Set Up Environment########################################

streamingEnvironment = StreamExecutionEnvironment.get_execution_environment()

streamingEnvironment.add_jars("file:///opt/flink/usrlib/flink-sql-connector-kafka-3.2.0-1.18.jar")
streamingEnvironment.set_parallelism(1)
streamingEnvironment.set_runtime_mode(RuntimeExecutionMode.STREAMING)

####################################Json Schema########################################

row_type_info = Types.ROW_NAMED(
    ['id', 'latitude','longitude', 'receptionTime'],  # i campi principali
    [
        Types.INT(), 
        Types.FLOAT(),  
        Types.FLOAT(),   
        Types.STRING()
        
    ]
)

row_type_info_message = Types.ROW_NAMED(
    ['id', 'message', 'latitude','longitude','creationTime'],  # i campi principali
    [
        Types.INT(),  # tipo per 'id'
        Types.STRING(),
        Types.FLOAT(),  
        Types.FLOAT(),
        Types.STRING()
    ]
)
json_format_serialize_message = JsonRowSerializationSchema.builder()\
                                .with_type_info(row_type_info_message)\
                                .build()

json_format_deserialize = JsonRowDeserializationSchema.builder()\
                          .type_info(row_type_info)\
                          .build()


class MapDataToMessages(MapFunction):

    class Messaggio(BaseModel): 
        '''Message returned by LLM'''

        pubblicita: str = Field(descrition="Messaggio pubblicitario prodotto lungo almeno 200 caratteri")
        attivita: str = Field(descrition="Nome dell'attività di cui è stato prodotto l'annuncio")
        #spiegazione: str = Field(description="Spiega perchè hai scelto questo punto di iteresse per l'utente")

    def open(self,runtime):
        ####### Connect to DB service #########
        self.serviceDb = BatchDatabaseUser()
        self.userDictionary = self.serviceDb.getFirstUser()
        #self.pointOfInterest = self.serviceDb.getPointsOfInterestAsString()#sarebbero da passare le coordinate come parametro

        #######Connect to LLM API############
        self.chat = ChatGroq(
            groq_api_key=GROQ_API_KEY,
            model="Gemma2-9b-it",
            temperature=0.6,
            max_tokens=None,
            timeout=None,
            max_retries=2,
            cache=False,
            # other params...
        )
        

    def map(self, value):

        activityDictList = self.serviceDb.getActivities(value[2], value[1])
        prompt = "Genera un messaggio pubblicitario personalizzato per attirare l'utente:\n"
        prompt += str(self.userDictionary) + "\n"
        prompt += '''La pubblicità deve riguardare una sola attività o nessuna tra quelle elencate. Nella scelta considera i seguenti criteri in ordine di importanza:
        1. L'attività deve almeno avere una categoria che corrisponda agli interessi dell'utente.
        2. Se ci sono più corrispondenze, scegli l'attività più vicina in base a Latitudine e Longitudine.
        3. Se non c'è corrispondenza, restituisci 'No match'.'''
        prompt += "\nQueste sono le attività fra cui puoi scegliere:\n"
        for activityDict in activityDictList:
            prompt += " - " + str(activityDict) + "\n"
        prompt += '''Il messaggio deve essere lungo fra i 200 e 300 caratteri e deve riguardare al massimo una fra le attività. Il messaggio deve essere uno solo. La risposta deve essere in lingua italiana.'''
        print(prompt)
        print("\n")

        # Definizione struttura output LLM
        structured_model = self.chat.with_structured_output(self.Messaggio)

        # Gestione del rate limit (15000 token al minuto con l'API Groq)
        while True:
            try:
                responseFromLLM = structured_model.invoke(prompt)
                break  # Esci dal loop se la richiesta ha successo
            except Exception as e:  # Gestione generica
                error_message = str(e)
                if "rate limit reached" in error_message.lower():
                    retry_after = float(error_message.split("in ")[1].split("s")[0])
                    print(f"Rate limit raggiunto, attesa di {retry_after} secondi...")
                    time.sleep(retry_after)
                else:
                    raise  # Rilancia l'errore se non è un RateLimitError

        response_dict = responseFromLLM.model_dump() # Coversione necessaria perchè flink non accetta la classe BaseModel di pydantic

        print(response_dict["pubblicita"])
        print(response_dict["attivita"])
        print("\n\n")

        row = Row(id=self.userDictionary["id"], 
                  message=response_dict["pubblicita"],
                  latitude=value[1],
                  longitude=value[2],
                  creationTime=datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        )
        return row

    

####################################Consumer########################################

source = KafkaSource.builder() \
        .set_bootstrap_servers("kafka:9092") \
        .set_topics("SimulatorPosition") \
        .set_group_id("pyfinkJob") \
        .set_value_only_deserializer(json_format_deserialize) \
        .set_property("enable.auto.commit", "true") \
        .set_property("commit.offsets.on.checkpoint", "true") \
        .build()
#.set_value_only_deserializer(SimpleStringSchema()) \
datastream = streamingEnvironment.from_source(source,WatermarkStrategy.for_monotonous_timestamps(), "Kafka Source")
datastream.key_by(lambda x: x[0], key_type=Types.INT())

mappedstream = datastream.map(MapDataToMessages(), output_type=row_type_info_message)






####################################Producer########################################


record_serializer = KafkaRecordSerializationSchema.builder() \
                    .set_topic("MessageElaborated") \
                    .set_key_serialization_schema(JsonRowSerializationSchema.builder()\
                                .with_type_info(Types.ROW_NAMED(
                                ['id'],  # i campi principali
                                [
                                    Types.INT()
                                ]))\
                                .build())\
                    .set_value_serialization_schema(json_format_serialize_message) \
                    .build() 
                    
sink = KafkaSink.builder() \
       .set_bootstrap_servers("kafka:9092") \
       .set_record_serializer(record_serializer) \
       .build()

# testCoordinates = [
#     {"id": 123, "coordinates": {"latitude": 40.7128, "longitude": -74.0060}},
#     {"id": 124, "coordinates": {"latitude": 34.0522, "longitude": -118.2437}},
#     {"id": 125, "coordinates": {"latitude": 51.5074, "longitude": -0.1278}},
# ]

# Converte il dizionario in un flusso di oggetti JSON
#stream = streamingEnvironment.from_collection(testCoordinates, type_info=row_type_info)



#stream = streamingEnvironment.from_source(source,WatermarkStrategy.for_monotonous_timestamps(), "Kafka Source")


mappedstream.sink_to(sink)

streamingEnvironment.execute()