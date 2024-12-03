from langchain_groq import ChatGroq
import clickhouse_connect
import json
from datetime import date, datetime


def get_user_dict(utenti):
    user_dict = {
        "Nome": utenti[0][0],
        "Cognome": utenti[0][1],
        "Genere": utenti[0][2],
        "Data_nascita": utenti[0][3],
        "Stato_civile": utenti[0][4],
        "Latitudine": utenti[0][5],
        "Longitudine": utenti[0][6],
    }
    c = 1
    for utente in utenti:
        key = "Interesse"+str(c)
        user_dict[key] = utente[7]
        c += 1
    
    return user_dict
    
def get_poi_dict(poi):
    poi_dict = {
        "Nome_punto": poi[0],
        "Latitudine": poi[1],
        "Longitudine": poi[2],
        "Indirizzo": poi[3],
        "Categoria": poi[4]
    }

    return poi_dict

def generate_prompt(utenti, poi_categorie):
    prompt = "Genera un messaggio pubblicitario personalizzato per l'utente dato scegliendo uno o nessuno dei punti di interesse.\n"
    prompt += "Utente:\n"
    prompt += str(get_user_dict(utenti)) + "\n"
    prompt += "Punti di interesse:\n"
    for single_poi in poi_categorie:
        prompt += str(get_poi_dict(single_poi)) + "\n"
    prompt += "Genera un solo messaggio di massimo 200 caratteri che publicizzi uno e uno solo oppure nessuno dei punti di interesse dati a seconda della distanza dall'utente e dalla conformità agli interessi dell'utente. Se non scegli nessun punto di interesse restituisci la stringa \'No match\'. Ricorda che puoi publicizzare un solo punto di interesse, non di più e che devi generare un solo messaggio, non di più. La risposta deve tassativamente essere in lingua italiana"
    return prompt




llm = ChatGroq(
    groq_api_key="your-key-here",
    model="mixtral-8x7b-32768",
    temperature=0,
    max_tokens=None,
    timeout=None,
    max_retries=2,
    # other params...
)

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
poi_categorie = client.query('''
SELECT
    pi.nome,
    pi.lon,
    pi.lat,
    pi.indirizzo,
    c.categoria
FROM 
    default.punto_interesse AS pi
INNER JOIN
    default.categoria AS c 
ON
    pi.id = c.punto_interesse
''').result_rows

# Chiudere il client
client.close()

prompt = generate_prompt(utenti, poi_categorie)

ai_msg = llm.invoke(prompt)

print(ai_msg.content)