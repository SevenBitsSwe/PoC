import os
import osmnx as ox
import random
from faker import Faker
from geopy.geocoders import Nominatim
from geopy.exc import GeocoderTimedOut, GeocoderServiceError

# Configura il centro e il raggio
CENTER_LAT = 45.39
CENTER_LNG = 11.87
RADIUS = 4000  # in metri
NUM_POINTS = 200  # Numero di punti di interesse desiderati

# Inizializza Faker
fake = Faker("it_IT")  # Utilizza il locale italiano per nomi realistici

# Ottieni il grafo stradale dell'area specificata
G = ox.graph_from_point((CENTER_LAT, CENTER_LNG), dist=RADIUS, network_type="drive")

geolocator = Nominatim(user_agent="poi_generator")


# Funzione per generare punti casuali lungo le strade
def generate_random_points(G, num_points):
    nodes = list(G.nodes)
    points = []
    for _ in range(num_points):
        node = random.choice(nodes)
        point = (G.nodes[node]["y"], G.nodes[node]["x"])
        points.append(point)
    return points


# Funzione per ottenere l'indirizzo dalle coordinate
def get_address(lat, lon):
    try:
        location = geolocator.reverse((lat, lon), exactly_one=True)
        if location:
            address = location.address.replace("'", "''")
            # Rimuovi il numero civico dall'indirizzo
            address_parts = address.split(", ")
            if any(char.isdigit() for char in address_parts[0]):
                address_parts.pop(0)
            return ", ".join(address_parts), 1
            # return location.address.replace("'", "''"), True
        else:
            return generate_partial_address(lat, lon), 2
    except (GeocoderTimedOut, GeocoderServiceError):
        return generate_partial_address(lat, lon), 2


# Funzione per generare un indirizzo parziale
def generate_partial_address(lat, lon):
    try:
        location = geolocator.reverse((lat, lon), exactly_one=True, language="it")
        if location:
            address = location.raw.get("address", {})
            road = address.get("road", fake.street_name())
            suburb = address.get("suburb", fake.city())
            city = address.get("city", fake.city())
            region = address.get("state", fake.state())
            postal_code = address.get("postcode", fake.postcode())
            country = address.get("country", "Italia")
            partial_address = (
                f"{road}, {suburb}, {city}, {region}, {postal_code}, {country}"
            )
            return partial_address.replace("'", "''")
        else:
            return generate_fake_address(), 3
    except (GeocoderTimedOut, GeocoderServiceError):
        return generate_fake_address(), 3


# Funzione per generare un indirizzo fittizio
def generate_fake_address():
    road = fake.street_name()
    suburb = fake.city()
    city = fake.city()
    region = fake.state()
    postal_code = fake.postcode()
    country = "Italia"
    address = f"{road}, {suburb}, {city}, {region}, {postal_code}, {country}"
    return address.replace("'", "''")


# Funzione per generare una descrizione dell'attività
def generate_activity_description():
    type = random.choice(["Cibo", "Sport"])
    if type == "Cibo":
        description = random.choice(
            ["Ristorante Italiano", "Pizzeria", "Gelateria", "Bar", "Caffetteria"]
        )
    else:
        description = random.choice(
            ["Palestra", "Piscina", "Campo da calcio", "Campo da tennis", "Centro yoga"]
        )
    return type, description


# Funzione principale per generare il file SQL
def main():
    # Genera i punti di interesse
    points = generate_random_points(G, NUM_POINTS)

    # Crea il contenuto del file SQL
    sql_content = """CREATE TABLE nearyou.punto_interesse(
  id UInt32,
  nome String,
  lon Float64,
  lat Float64,
  indirizzo String,
  tipologia String,
  descrizione String,
  PRIMARY KEY(id)
) ENGINE = MergeTree()
ORDER BY id;

INSERT INTO nearyou.punto_interesse (id, nome, lon, lat, indirizzo, tipologia, descrizione) VALUES
"""

    values = []
    for i, (lat, lon) in enumerate(points, start=1):
        name = fake.company().replace(
            "'", "''"
        )  # Genera un nome realistico per il punto di interesse e sostituisce gli apostrofi
        address, is_real = get_address(lat, lon)
        match is_real:
            case 1:
                status = "Reale"
            case 2:
                status = "Parziale"
            case 3:
                status = "Fittizio"
            case _:
                status = "Fittizio"
        print(f"{i}: {status}")
        type, description = generate_activity_description()
        values.append(
            f"({i}, '{name}', {lon}, {lat}, '{address}', '{type}', '{description}')"
        )

    sql_content += ",\n".join(values) + ";"

    # Scrivi il contenuto nel file SQL
    if not os.path.exists("StorageData"):
        os.makedirs("StorageData")
    with open("StorageData/puntoInteresse.sql", "w") as f:
        f.write(sql_content)

    print("File SQL aggiornato con i nuovi punti di interesse.")


# Esegui la funzione principale
if __name__ == "__main__":
    main()
