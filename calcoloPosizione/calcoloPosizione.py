import clickhouse_connect
import json
import time

#time.sleep(3)


def distanza(utenti):
    for utente in utenti:
        client = clickhouse_connect.get_client(host='clickhouse', port=8123, username='default', password='')
        
        params = {
            'lon': utente[5],
            'lat': utente[6]
        }

        query ='''
        SELECT
            pi.nome,
            pi.indirizzo,
            c.categoria,
            geoDistance( %(lon)s , %(lat)s  ,pi.lon ,pi.lat)
        FROM 
            default.punto_interesse AS pi
        INNER JOIN
            default.categoria AS c 
        ON
            pi.id = c.punto_interesse
        WHERE
            geoDistance( %(lon)s , %(lat)s  ,pi.lon ,pi.lat) <= 50'''
        
        poi = client.query(query,parameters=params).result_rows

        client.close()

        for single_poi in poi:
            print("\nLa distanza tra "+utente[0]+" "+utente[1]+" e il poi "+single_poi[0]+" è minore di 50 metri!\n")


# Connessione al server ClickHouse
client = clickhouse_connect.get_client(host='clickhouse', port=8123, username='default', password='')

# Lettura dei dati dalla tabella utente JOIN interesse
utenti = client.query('''
SELECT
    u.nome,
    u.cognome,
    u.genere,
    u.data_nascita,
    u.stato_civile,
    u.lon,
    u.lat,
    i.interesse
FROM 
    default.utente AS u
INNER JOIN
    default.interesse AS i 
ON
    u.id = i.utente
''').result_rows

# Lettura dei dati dalla tabella punto_interesse JOIN categoria
#query per prendere già i poi nel raggio di 50 metri dall'utente

# Chiudere il client
client.close()

distanza(utenti)
