-- Elimina le tabelle se già presenti
DROP TABLE IF EXISTS messages;
DROP TABLE IF EXISTS positions;
DROP TABLE IF EXISTS users;

-- Crea la tabella per i messaggi ricevuti da Kafka
CREATE TABLE messages (
                          id String , -- Questo identifica il percorso
                          message String,
                          received_at DateTime
) ENGINE = Kafka('kafka:9092', 'messaggi', 'messaggi_group', 'JSONEachRow')
      SETTINGS kafka_thread_per_consumer = 0, kafka_num_consumers = 1;

-- Crea la tabella per le posizioni ricevute da un altro Kafka
CREATE TABLE positions (
                           id String, -- Questo identifica il percorso
                           point_id UInt32, -- Questo identifica il punto nel percorso
                           latitude Float64,
                           longitude Float64,
                           received_at DateTime
) ENGINE = Kafka('kafka:9092', 'posizioni', 'posizioni_group', 'JSONEachRow')
      SETTINGS kafka_thread_per_consumer = 0, kafka_num_consumers = 1;

-- Crea la tabella per i dati statici degli utenti
CREATE TABLE users (
                       id UInt32,
                       name String,
                       email String,
                       created_at DateTime
) ENGINE = MergeTree()
      ORDER BY id;

-- Inserisce dati mockup nella tabella users
INSERT INTO users VALUES
                      (1, 'User 1', 'user1@example.com', now()),
                      (2, 'User 2', 'user2@example.com', now()),
                      (3, 'User 3', 'user3@example.com', now()),
                      (4, 'User 4', 'user4@example.com', now()),
                      (5, 'User 5', 'user5@example.com', now()),
                      (6, 'User 6', 'user6@example.com', now());
