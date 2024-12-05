
CREATE TABLE nearyou.messageTableKafka
(
    id Int16,
    message String,
    creationTime String

) 
ENGINE = Kafka('kafka:9092', 'MessageElaborated', 'clickhouseConsumerMessage', 'JSONEachRow')
      SETTINGS kafka_thread_per_consumer = 0, kafka_num_consumers = 1;


CREATE TABLE nearyou.messageTable
(
    id Int16,
    message String,
    creationTime String
)
ENGINE = MergeTree()
PARTITION BY toYYYYMM(toDateTime(creationTime))   -- Partizione per mese basato sul timestamp di creazione
PRIMARY KEY (id, toStartOfMinute(toDateTime(creationTime)), creationTime)
TTL toDateTime(creationTime) + INTERVAL 1 MONTH   -- I dati saranno conservati per 1 mese
SETTINGS index_granularity = 8192;




CREATE MATERIALIZED VIEW nearyou.mv_messageTable TO nearyou.messageTable
AS
SELECT
    id,
    message,
    creationTime
FROM nearyou.messageTableKafka

