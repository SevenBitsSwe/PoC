
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

import os
from dotenv import load_dotenv
from langchain_core.prompts import ChatPromptTemplate
from langchain_groq import ChatGroq
# Carica il file .env




# Recupera la variabile di ambiente

load_dotenv()
GROQ_API_KEY = os.getenv('PYTHON_PROGRAM_KEY')



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
    ['id', 'message','creationTime'],  # i campi principali
    [
        Types.INT(),  # tipo per 'id'
        Types.STRING(),
        Types.STRING()
    ]
)
json_format_serialize_message = JsonRowSerializationSchema.builder().with_type_info(row_type_info_message).build()

json_format_deserialize = JsonRowDeserializationSchema.builder().type_info(row_type_info).build()

streamingEnvironment.add_python_file("dbflink.py")

import logging

# Configura il logger per scrivere su un file
logging.basicConfig(level=logging.DEBUG)

class MapDataToMessages(MapFunction):

    def open(self,runtime):
        ####### Connect to DB service #########
        serviceDb = BatchDatabaseUser()
        self.userDictionary = serviceDb.getUser()
        self.pointOfInterest = serviceDb.getPointsOfInterestAsString()#sarebbero da passare le coordinate come parametro

        #######Connect to LLM API############
        self.chat = ChatGroq(temperature=0, groq_api_key=GROQ_API_KEY, model_name="mixtral-8x7b-32768")



    def map(self, value):

        messageToLLM = "Genera un messaggio pubblicitario personalizzato per l'utente dato scegliendo uno o nessuno dei punti di interesse.\n"
        messageToLLM += "Utente:\n"
        self.userDictionary.update({"Latitudine" : str(value[1]), "Longitudine" : str(value[2])})
        messageToLLM += str(self.userDictionary) + "\n"
        print("icao")
        messageToLLM += "Punti di interesse:\n"
        messageToLLM += self.pointOfInterest
        messageToLLM += '''Genera un solo messaggio di massimo 200 caratteri che publicizzi uno e uno solo oppure nessuno dei punti di interesse 
                        dati a seconda della distanza dall'utente e dalla conformità agli interessi dell'utente. Se non scegli nessun punto di interesse restituisci
                        la stringa - No match - . Ricorda che puoi publicizzare un solo punto di interesse, non di più e che devi generare un solo messaggio, non di più.
                        La risposta deve tassativamente essere in lingua italiana 
                        '''
        logging.debug("ciao")
        responseFromLLM = self.chat.invoke(messageToLLM).content
        row = Row(id=self.userDictionary["id"], message=responseFromLLM,creationTime=datetime.now().strftime("%Y-%m-%d %H:%M:%S"))

        return row

    


####################################Consumer########################################
source = KafkaSource.builder() \
        .set_bootstrap_servers("kafka:9092") \
        .set_topics("SimulatorPosition") \
        .set_group_id("analysis") \
        .set_value_only_deserializer(json_format_deserialize) \
        .set_property("enable.auto.commit", "true") \
        .set_property("commit.offsets.on.checkpoint", "true") \
        .build()
#.set_value_only_deserializer(SimpleStringSchema()) \
datastream = streamingEnvironment.from_source(source,WatermarkStrategy.for_monotonous_timestamps(), "Kafka Source")

mappedstream = datastream.map(MapDataToMessages(), output_type=row_type_info_message)





####################################Producer########################################



record_serializer = KafkaRecordSerializationSchema.builder() \
                    .set_topic("MessageElaborated") \
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