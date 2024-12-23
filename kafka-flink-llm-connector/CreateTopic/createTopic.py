from kafka.admin import KafkaAdminClient, NewTopic

admin_client = KafkaAdminClient(
    bootstrap_servers="kafka:9092",
    client_id="creation"
)

#creo lista di tutti i topic che voglio creare
topic_list=[]
topic_list.append(NewTopic(name="SimulatorPosition", num_partitions=1, replication_factor=1))
topic_list.append(NewTopic(name="MessageElaborated", num_partitions=1, replication_factor=1))

#creo i topic e chiudo la connessione a kafka
admin_client.create_topics(topic_list)
admin_client.close()
