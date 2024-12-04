from langchain_groq import ChatGroq
import clickhouse_connect
import json
from datetime import date, datetime
from typing import Optional
from pydantic import BaseModel, Field


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
    prompt = "Genera un messaggio pubblicitario personalizzato per attirare l'utente:\n"
    prompt += str(get_user_dict(utenti)) + "\n"
    prompt += '''La pubblicità deve riguardare una sola attività o nessuna tra quelle elencate. Nella scelta considera i seguenti criteri in ordine di importanza:
1. L'attività deve almeno avere una categoria che corrisponda agli interessi dell'utente.
2. Se ci sono più corrispondenze, scegli l'attività più vicina in base a Latitudine e Longitudine.
3. Se non c'è corrispondenza, restituisci 'No match'.'''
    prompt += "\nQueste sono le attività fra cui puoi scegliere:\n"
    for single_poi in poi_categorie:
        prompt += " - " + str(get_poi_dict(single_poi)) + "\n"
    prompt += '''Il messaggio deve essere lungo fra i 200 e 300 caratteri e deve riguardare al massimo una fra le attività. Il messaggio deve essere uno solo. La risposta deve essere in lingua italiana.'''
    return prompt




llm = ChatGroq(
    groq_api_key="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",
    model="Gemma2-9b-it",
    temperature=0.6,
    max_tokens=None,
    timeout=None,
    max_retries=2,
    cache=False,
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

class Messaggio(BaseModel): 
    '''Message returned by LLM'''

    pubblicita: str = Field(descrition="Messaggio pubblicitario prodotto lungo almeno 200 caratteri")
    punto_interesse: str = Field(descrition="Nome dell'attività di cui è stato prodotto l'annuncio")
    #spiegazione: str = Field(description="Spiega perchè hai scelto questo punto di iteresse per l'utente")

structured_model = llm.with_structured_output(Messaggio)
ai_msg = structured_model.invoke(prompt)

print(prompt)

print(ai_msg.pubblicita)
print(ai_msg.punto_interesse)
#print(ai_msg.spiegazione)