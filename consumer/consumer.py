import json
import sys
from confluent_kafka import Consumer, KafkaException, KafkaError

print("\n<Consuming>")
consumer = Consumer(
    {
        "bootstrap.servers": "kafka:9092",
        "group.id": "default",
        "auto.offset.reset": "earliest",
    }
)

running = True


def basic_consume_loop(consumer, topics):
    try:
        consumer.subscribe(topics)
        print("subscribed")
        sys.stdout.flush()
        while running:
            msg = consumer.poll(1.0)
            print("polled")
            sys.stdout.flush()
            if msg is None:
                continue

            if msg.error():
                if msg.error().code() == KafkaError._PARTITION_EOF:
                    # End of partition event
                    sys.stderr.write(
                        "%% %s [%d] reached end at offset %d\n"
                        % (msg.topic(), msg.partition(), msg.offset())
                    )
                elif msg.error():
                    raise KafkaException(msg.error())
            else:
                print(
                    '✅  Message received:  "{}" from topic {}\n'.format(
                        json.loads(msg.value().decode("utf-8")), msg.topic()
                    )
                )
                sys.stdout.flush()
    finally:
        # Close down consumer to commit final offsets.
        consumer.close()


if __name__ == "__main__":
    basic_consume_loop(consumer, ["messaggi"])


# Il pezzo di codice qui sotto è la versione di quello gia presente senza funzioni.

# try:
#     consumer.subscribe(topics)
#     print("subscribed")
#     sys.stdout.flush()
#     while running:
#         msg = consumer.poll(1.0)
#         print("polled")
#         sys.stdout.flush()
#         if msg is None:
#             continue
#
#         if msg.error():
#             if msg.error().code() == KafkaError._PARTITION_EOF:
#                 # End of partition event
#                 print(
#                     "%% %s [%d] reached end at offset %d\n"
#                     % (msg.topic(), msg.partition(), msg.offset())
#                 )
#                 sys.stdout.flush()
#             elif msg.error():
#                 raise KafkaException(msg.error())
#         else:
#             print(
#                 '✅  Message received:  "{}" from topic {}\n'.format(
#                     json.loads(msg.value().decode("utf-8")), msg.topic()
#                 )
#             )
#             sys.stdout.flush()
# finally:
#     # Close down consumer to commit final offsets.
#     consumer.close()
