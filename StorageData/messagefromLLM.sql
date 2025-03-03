
CREATE TABLE nearyou.messageTableKafka
(
    id Int16,
    message String,
    latitude Float64,
    longitude Float64,
    creationTime String

) 
ENGINE = Kafka('kafka:9092', 'MessageElaborated', 'clickhouseConsumerMessage', 'JSONEachRow')
      SETTINGS kafka_thread_per_consumer = 0, kafka_num_consumers = 1;


CREATE TABLE nearyou.messageTable
(
    id Int16,
    message String,
    latitude Float64,
    longitude Float64,
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
    latitude,
    longitude,
    creationTime
FROM nearyou.messageTableKafka

-- SELECT 
--     m.longitude, 
--     m.latitude, 
--     m.message
-- FROM 
--     (SELECT * 
--      FROM "nearyou"."messageTable" 
--      ORDER BY creationTime DESC 
--      LIMIT 1) AS m
-- INNER JOIN 
--     (SELECT * 
--      FROM "nearyou"."positions" 
--      ORDER BY received_at DESC 
--      LIMIT 1) AS p
-- ON m.id = p.id
-- WHERE geoDistance(p.latitude, p.longitude, m.latitude, m.longitude) <= 400;


          --"rawSql": "SELECT \n    m.longitude, \n    m.latitude, \n    m.message\nFROM \n    (SELECT * \n     FROM \"nearyou\".\"messageTable\" \n     ORDER BY creationTime DESC \n     LIMIT 1) AS m\nINNER JOIN \n    (SELECT * \n     FROM \"nearyou\".\"positions\" \n     ORDER BY received_at DESC \n     LIMIT 1) AS p\nON m.id = p.id\nWHERE geoDistance(p.latitude, p.longitude, m.latitude, m.longitude) <= 400;",