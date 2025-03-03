CREATE TABLE nearyou.positionsKafka (
                           id Int16,
                           latitude Float64,
                           longitude Float64,
                           received_at String
) ENGINE = Kafka()
SETTINGS 
    kafka_broker_list = 'kafka:9092',
    kafka_topic_list = 'SimulatorPosition',
    kafka_group_name = 'clickhouseConsumePositions',
    kafka_format = 'JSONEachRow';



CREATE TABLE nearyou.positions
(
    id Int16,
    latitude Float64,
    longitude Float64,
    received_at String
)
ENGINE = MergeTree()
PARTITION BY toYYYYMM(toDateTime(received_at))  -- Partizioniamo per mese in base al campo received_at
PRIMARY KEY (id, toStartOfMinute(toDateTime(received_at)), received_at)
TTL toDateTime(received_at) + INTERVAL 1 MONTH  -- I dati vengono conservati per un mese
SETTINGS index_granularity = 8192;


CREATE MATERIALIZED VIEW nearyou.mv_positions TO nearyou.positions
AS
SELECT
    id,
    latitude,
    longitude,
    received_at
FROM nearyou.positionsKafka;

---SELECT * FROM "nearyou"."positions" ORDER BY received_at DESC LIMIT 2


