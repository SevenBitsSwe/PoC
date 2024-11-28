
from pyflink.datastream import StreamExecutionEnvironment
from pyflink.datastream.execution_mode import RuntimeExecutionMode
from pyflink.common.watermark_strategy import WatermarkStrategy
from py4j.java_gateway import JavaObject, get_java_class
from pyflink.common import Types
from pyflink.datastream.functions import MapFunction
import json
from pyflink.common import DeserializationSchema, TypeInformation, typeinfo, SerializationSchema
from pyflink.datastream.connectors.kafka import KafkaSource,KafkaSink,KafkaRecordSerializationSchema,KafkaOffsetsInitializer
from pyflink.common.serialization import SimpleStringSchema
from pyflink.datastream.formats.json import JsonRowDeserializationSchema,JsonRowSerializationSchema

import os
from dotenv import load_dotenv
from langchain_core.prompts import ChatPromptTemplate
from langchain_groq import ChatGroq
# Carica il file .env


# Recupera la variabile di ambiente




####################################Set Up Environment########################################

env = StreamExecutionEnvironment.get_execution_environment()

env.add_jars("file:///opt/flink/usrlib/flink-sql-connector-kafka-3.2.0-1.18.jar")
env.set_parallelism(1)
env.set_runtime_mode(RuntimeExecutionMode.STREAMING)

####################################Json Schema########################################

row_type_info = Types.ROW_NAMED(
    ['id', 'coordinates'],  # i campi principali
    [
        Types.INT(),  # tipo per 'id'
        Types.ROW_NAMED( 
            ['latitude','longitude'], # tipo per 'coordinates'
            [
                Types.FLOAT(),  # tipo per 'latitude'
                Types.FLOAT()   # tipo per 'longitude'
            ]
        )
    ]
)
json_format_serialize = JsonRowSerializationSchema.builder().with_type_info(row_type_info).build()
json_format_deserialize = JsonRowDeserializationSchema.builder().type_info(row_type_info).build()

load_dotenv()
GROQ_API_KEY = os.getenv('PYTHON_PROGRAM_KEY')
class MyMapFunction(MapFunction):
    def map(self, value):
        
        chat = ChatGroq(temperature=0, groq_api_key=GROQ_API_KEY, model_name="mixtral-8x7b-32768")

        messages = [
        ("system", f"You are a helpful translator. Increment the number {value[1][1]} by 5 and return only the result, no text.")        ]
        
        response = chat.invoke(messages)
        variabile = float(response.content.split("\n")[0])  

        value[1][1] = variabile
        return value

    


####################################Consumer########################################
source = KafkaSource.builder() \
        .set_bootstrap_servers("kafka:9092") \
        .set_topics("nuovo") \
        .set_group_id("analysis") \
        .set_value_only_deserializer(json_format_deserialize) \
        .set_property("enable.auto.commit", "true") \
        .set_property("commit.offsets.on.checkpoint", "true") \
        .build()
#.set_value_only_deserializer(SimpleStringSchema()) \
ds = env.from_source(source,WatermarkStrategy.for_monotonous_timestamps(), "Kafka Source")

ds.map(MyMapFunction()).print()





####################################Producer########################################

# record_serializer = KafkaRecordSerializationSchema.builder() \
#                     .set_topic("CoordinatesElaborated") \
#                     .set_value_serialization_schema(json_format_serialize) \
#                     .build() 
                    
# sink = KafkaSink.builder() \
#        .set_bootstrap_servers("kafka:9092") \
#        .set_record_serializer(record_serializer) \
#        .build()

# testCoordinates = [
#     {"id": 123, "coordinates": {"latitude": 40.7128, "longitude": -74.0060}},
#     {"id": 124, "coordinates": {"latitude": 34.0522, "longitude": -118.2437}},
#     {"id": 125, "coordinates": {"latitude": 51.5074, "longitude": -0.1278}},
# ]

# # Converte il dizionario in un flusso di oggetti JSON
# stream = env.from_collection(testCoordinates, type_info=row_type_info)



# #stream = env.from_source(source,WatermarkStrategy.for_monotonous_timestamps(), "Kafka Source")


# stream.sink_to(sink)

env.execute()