#!/usr/bin/bash


clickhouse-client --password="pass" --query="CREATE DATABASE IF NOT EXISTS user_database;"
clickhouse-client --password="pass" --query="USE user_database;"

 clickhouse-client --password="pass" --query="
 CREATE TABLE IF NOT EXISTS user (
    id INT PRIMARY KEY,    
    nome VARCHAR(100) NOT NULL,   
    cognome VARCHAR(100) NOT NULL,
    eta INT NOT NULL,            
    sesso ENUM('M', 'F', 'Altro')
);"



clickhouse-client --password="pass" --query="
CREATE TABLE default.utente(
       id UInt32,
       nome String,
       cognome String,
       email String,
       genere String,
       data_nascita Date DEFAULT toDate(now()),
       stato_civile String,
       PRIMARY KEY(id)
) ENGINE = MergeTree()
ORDER BY id;"

clickhouse-client --password="pass" --query="
INSERT INTO default.utente (id, nome, cognome, email, genere, data_nascita, stato_civile, lon, lat, timestamp_rilevamento) VALUES
(1, 'Mario', 'Rossi', 'mario.rossi@example.com', 'M', '1985-05-15', 'Single', 12.4924, 41.8902, now());"


clickhouse-client --password="pass" --query="
INSERT INTO user (id, nome, cognome, eta, sesso) VALUES
(1, 'Mario', 'Rossi', 30, 'M');"


clickhouse-client --password="pass" --query="
CREATE TABLE default.punto_interesse(
       id UInt32,
       nome String,
       lon Float64,
       lat Float64,
       indirizzo String,
       PRIMARY KEY(id)
) ENGINE = MergeTree()
ORDER BY id;"



clickhouse-client --password="pass" --query="
INSERT INTO default.punto_interesse (id, nome, lon, lat, indirizzo) VALUES
(1, 'Caffetteria Roma', 12.4930, 41.8905, 'Via Cavour 1, Roma'),
(2, 'Museo Romano', 12.4927, 41.8899, 'Piazza Venezia 2, Roma'),
(3, 'Ristorante La Dolce Vita', 12.4918, 41.8901, 'Via del Corso 10, Roma'),
(4, 'Hotel Colosseo', 12.4932, 41.8898, 'Via Nazionale 15, Roma'),
(5, 'Galleria di Arte Moderna', 12.4919, 41.8904, 'Via Barberini 7, Roma'),
(6, 'Parco della Vittoria', 12.4925, 41.8897, 'Viale Trastevere, Roma'),
(7, 'Teatro Romano', 12.4928, 41.8903, 'Piazza Navona, Roma'),
(8, 'Pasticceria Romana', 12.4931, 41.8900, 'Via Margutta 20, Roma'),
(9, 'Biblioteca Nazionale', 12.4923, 41.8906, 'Via della Conciliazione 3, Roma'),
(10, 'Cinema Roma', 12.4917, 41.8896, 'Via del Tritone 12, Roma');
"

clickhouse-client --password="pass" --query="
CREATE TABLE positions (
                           id Int16,
                           latitude Float64,
                           longitude Float64,
                           received_at String
) ENGINE = Kafka()
SETTINGS 
    kafka_broker_list = 'kafka:9092',
    kafka_topic_list = 'SimulatorPosition',
    kafka_group_name = 'clickhouseConsumePositions',
    kafka_format = 'JSONEachRow'
"

clickhouse-client --password="pass" --query="

CREATE TABLE messageTable
(
    id Int16,
    message String,
    creationTime String

) 
ENGINE = Kafka('kafka:9092', 'MessageElaborated', 'clickhouseConsumerMessage', 'JSONEachRow')
      SETTINGS kafka_thread_per_consumer = 0, kafka_num_consumers = 1;"




