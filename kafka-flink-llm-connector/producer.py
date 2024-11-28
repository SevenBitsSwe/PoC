from confluent_kafka import Producer
import json
import sys
from datetime import datetime
import uuid


message = []
for _ in range(30):  # Aggiungi 30 messaggi alla lista
    message.append({"id": 124, "coordinates": {"latitude": 34.0522, "longitude": -118.2437}})


def create_message(id, original_message):
    # # Crea il timestamp corrente
    # received_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

    # # Crea il messaggio nel formato richiesto
    # new_message = {"id": id, "message": original_message, "received_at": received_at}
    return json.dumps(original_message)


print("\n<Producing>")
p = Producer({"bootstrap.servers": "kafka:9092"})


try:
    for original_message in message:  # Ciclo su tutti i messaggi
        # Crea un messaggio con id e data
        formatted_message = create_message(str(uuid.uuid4()), original_message)

        print(f"Messaggio inviato: {formatted_message}")
        sys.stdout.flush()

        # Invia il messaggio a Kafka
        p.produce("nuovo", value=formatted_message.encode("utf-8"))
        p.flush()

        # Incrementa l'id per il prossimo messaggio
except Exception as e:
    print(f"Error sending data: {e}")
