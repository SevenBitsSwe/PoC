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

# print("\n\n\n\n\n\n\n\n\n\n\n\n")


print("\n<producing>")
sys.stdout.flush()

p = Producer({"bootstrap.servers": "kafka:9092"})

# Questo è il pezzo di codice che import il percorso GPX

# # Funzione per leggere un file GPX e restituire le coordinate
# def read_gpx(gpx_file):
#     with open(gpx_file, "r") as f:
#         gpx = gpxpy.parse(f)
#
#     # Estrai tutte le coordinate dei punti da tutte le tracce
#     coordinates = []
#     for track in gpx.tracks:
#         for segment in track.segments:
#             for point in segment.points:
#                 coordinates.append((point.latitude, point.longitude))
#     return coordinates
#
#
# # Carica il percorso dal file GPX
# gpx_file = (
#     "percorso.gpx"  # Assicurati che il file percorso.gpx sia nella stessa cartella
# )
# print(f"\nCaricando il file GPX: {gpx_file}")
# sys.stdout.flush()
#
# # Ottieni le coordinate dal file GPX
# route_coords = read_gpx(gpx_file)
# print(f"Coordinate caricate: {len(route_coords)} punti")
# sys.stdout.flush()

# Questo è il caricamento della mappa di Padova intera
# Molto pesante e sostitto con una mappa più piccola

# G = ox.graph_from_place("Padova, Italy", network_type="bike")
# # Carica una rete stradale per una zona ristretta

north, south, east, west = 45.420, 45.400, 11.880, 11.860
G = ox.graph_from_bbox(north, south, east, west, network_type="walk")

# Anche se c'è scritto walk va bene comunque dato che bike
# Trova solo percorsi fatti apposta per biciclette

print("Grafo creato per Padova, bicicletta")

# Definisci i punti di partenza e arrivo
start = (45.4064, 11.8768)  # Coordinate di esempio
end = (45.4184, 11.8818)  # Coordinate di esempio

# Trova i nodi più vicini ai punti di partenza e arrivo
orig_node = ox.distance.nearest_nodes(G, X=start[1], Y=start[0])
dest_node = ox.distance.nearest_nodes(G, X=end[1], Y=end[0])

# Calcola il percorso più breve
route = nx.shortest_path(G, orig_node, dest_node, weight="length")
print("Percorso calcolato")

# Ottieni le coordinate del percorso
route_coords = [(G.nodes[node]["y"], G.nodes[node]["x"]) for node in route]

# Verifica se ci sono abbastanza coordinate per generare posizioni
if len(route_coords) < 2:
    print("Errore: il percorso non ha abbastanza coordinate.")
else:

    def generate_positions(route_coords, speed_kmh, interval_seconds, route_id):
        speed_mps = speed_kmh * 1000 / 3600  # Converti la velocità in metri al secondo
        total_distance = 0
        position_id = 1  # Inizializza l'id delle posizioni

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
                    "id": position_id,
                    "route_id": route_id,
                    "latitude": latitude,
                    "longitude": longitude,
                    "received_at": received_at,
                }
                print(f"New position: {new_position}")
                sys.stdout.flush()

                # Invia il messaggio su Kafka
                p.produce("posizioni", key="posizione", value=json.dumps(new_position))
                p.flush()

                # Incrementa l'id
                position_id += 1

                # Aspetta prima di generare la prossima posizione
                # time.sleep(interval_seconds)

    try:
        generate_positions(route_coords, speed_kmh=15, interval_seconds=20, route_id=1)
    except Exception as e:
        print(f"Error sending data: {e}")
        sys.stdout.flush()
