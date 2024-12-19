from confluent_kafka import Producer
import json
import osmnx as ox
import networkx as nx
from geopy.distance import geodesic
from datetime import datetime
import time
import gpxpy
import gpxpy.parser
import sys
import random
import uuid

print("\n<producing>")
sys.stdout.flush()

p = Producer({"bootstrap.servers": "kafka:9092"})

point = (45.39, 11.87)
dist = 4000
G = ox.graph_from_point(point, dist, network_type="walk")


# Ottieni i nodi del grafo
nodes = list(G.nodes)

# Seleziona due nodi casuali come punto di partenza e arrivo
orig_node = random.choice(nodes)
dest_node = random.choice(nodes)

# Calcola il percorso più breve
route = nx.shortest_path(G, orig_node, dest_node, weight="length")
print("Percorso calcolato")

# Ottieni le coordinate del percorso
route_coords = [(G.nodes[node]["y"], G.nodes[node]["x"]) for node in route]

# Verifica se ci sono abbastanza coordinate per generare posizioni
if len(route_coords) < 2:
    print("Errore: il percorso non ha abbastanza coordinate.")
else:

    def generate_positions(route_coords, speed_kmh, interval_seconds):
        speed_mps = speed_kmh * 1000 / 3600  # Converti la velocità in metri al secondo
        total_distance = 0
        #id = str(uuid.uuid4())  # Genera un id univoco per il percorso
        id = 1 #idutenteBase

        for i in range(len(route_coords) - 1):
            start_point = route_coords[i]
            end_point = route_coords[i + 1]

            # Calcola la distanza tra i punti
            segment_distance = geodesic(start_point, end_point).meters
            total_distance += segment_distance
            num_positions = int(segment_distance / (speed_mps * interval_seconds))

            for j in range(num_positions):
                fraction = j / num_positions
                # Calcola la nuova posizione come interpolazione lineare
                latitude = start_point[0] + fraction * (end_point[0] - start_point[0])
                longitude = start_point[1] + fraction * (end_point[1] - start_point[1])

                # Crea il timestamp corrente
                received_at = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

                # Crea un dizionario JSON
                new_position = {
                    "id": id,
                    "latitude": float(latitude),
                    "longitude": float(longitude),
                    "received_at": received_at,
                }
                print(f"New position: {new_position}")
                sys.stdout.flush()

                # Invia il messaggio su Kafka
                jsonProva = json.dumps(new_position)
                p.produce("SimulatorPosition",key=json.dumps(new_position["id"]), value=jsonProva.encode("utf-8"))
                p.flush()

                # Incrementa l'id
                #point_id += 1

                # Aspetta prima di generare la prossima posizione
                time.sleep(interval_seconds)

    try:
        generate_positions(route_coords, speed_kmh=15, interval_seconds=10)
    except Exception as e:
        print(f"Error sending data: {e}")
        sys.stdout.flush()