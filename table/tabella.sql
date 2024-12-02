-- Cancellazione tabelle se già presenti
DROP TABLE IF EXISTS utente;
DROP TABLE IF EXISTS punto_interesse;
DROP TABLE IF EXISTS annuncio;

-- Creazione tabella utente
CREATE TABLE utente(
       -- dati utenti di quando si registra
       id UInt32,
       nome String,
       cognome String,
       email String,
       genere String,
       data_nascita Date DEFAULT toDate(now()),
       stato_civile String,
       -- dati posizionali
       lon Float64,
       lat Float64,
       timestamp_rilevamento DateTime,

       PRIMARY KEY(id)
)ENGINE = MergeTree()
ORDER BY id;

-- Creazione tabella punto di interesse
CREATE TABLE punto_interesse(
       id UInt32,
       nome String,
       lon Float64,
       lat Float64,
       indirizzo String,
       PRIMARY KEY(id)
)ENGINE = MergeTree()
ORDER BY id;

-- Creazione tabella annuncio
CREATE TABLE messaggio(
       punto_interesse UInt32,
       utente UInt32,
       timestamp DateTime,
       contenuto String,
       PRIMARY KEY(punto_interesse, utente, timestamp)
)ENGINE = MergeTree()
ORDER BY (punto_interesse, utente, timestamp);
