import clickhouse_connect

class BatchDatabaseUser():

    
    def __init__(self):
        self.databaseClient = clickhouse_connect.get_client(
            host='clickhouse', 
            port=8123, 
            username='default', 
            password='pass'
        )
    
    def getFirstUser(self) -> dict:
        return self.databaseClient.query('SELECT * FROM nearyou.utente').first_item
    
    def getActivities(self, lon, lat) -> list:
        params = {
            'lon': lon,
            'lat': lat
        }

        query ='''
        SELECT
            pi.nome,
            pi.indirizzo,
            c.categoria,
            geoDistance( %(lon)s , %(lat)s  ,pi.lon ,pi.lat)
        FROM 
            nearyou.attivita AS pi
        INNER JOIN
            nearyou.interesseAttivita AS c 
        ON
            pi.id = c.punto_interesse
        WHERE
            geoDistance( %(lon)s , %(lat)s  ,pi.lon ,pi.lat) >= 0'''
        
        return self.databaseClient.query(query,parameters=params).result_rows
        

    
    def getPointsOfInterestAsString(self) -> str : 
        stringPoI = "" 

        listOfPoI = self.databaseClient.query('SELECT * FROM nearyou.attivita').result_rows
        for singlePoI in listOfPoI:
            dictionaryPoI = {
                "id": singlePoI[0],
                "nome": singlePoI[1],
                "Longitudine": singlePoI[2],
                "Latitudine": singlePoI[3],
                "Indirizzo": singlePoI[4]
            }
            stringPoI += str(dictionaryPoI) + "\n"
        
        return stringPoI
        




# from pyflink.table import EnvironmentSettings, TableEnvironment

# # Crea l'ambiente di esecuzione Flink in modalità batch
# env_settings = EnvironmentSettings.in_batch_mode()
# t_env = TableEnvironment.create(env_settings)

# # Aggiungi il JAR del driver JDBC (ad esempio, per ClickHouse)
# # Assicurati che il percorso del JAR sia corretto
# # t_env.get_config().get_configuration().set_string("pipeline.jars", "file:///opt/flink/usrlib/postgresql-42.2.29.jre7.jar")

# # t_env.get_config().get_configuration().set_string("pipeline.jars", "file:///opt/flink/usrlib/clickhouse-jdbc-0.7.0.jar")
# # t_env.get_config().get_configuration().set_string("pipeline.jars", "file:///opt/flink/usrlib/flink-sql-jdbc-driver-bundle-1.18.1.jar")



# t_env.get_config().get_configuration().set_string(
#     "pipeline.jars", 
#     "file:///opt/flink/usrlib/postgresql-42.2.29.jre7.jar,file:///opt/flink/usrlib/clickhouse-jdbc-0.7.0.jar,file:///opt/flink/usrlib/flink-sql-jdbc-driver-bundle-1.18.1.jar"
# )
# # Usa il comando SQL per creare la connessione JDBC
# t_env.execute_sql("""
#     CREATE TABLE users (
#         id BIGINT,
#         name STRING,
#         age INT,
#         status BOOLEAN
#     ) WITH (
#         'connector' = 'jdbc',
#         'url' = 'jdbc:clickhouse://localhost:9000',  -- URL del database
#         'driver' = 'ru.yandex.clickhouse.ClickHouseDriver',   -- Driver JDBC per ClickHouse
#         'username' = 'default',  -- Nome utente per ClickHouse
#         'password' = 'pass',  -- Password per ClickHouse
#         'table-name' = 'users'        -- Nome della tabella
#     )
# """)

# # Esegui una query SQL sulla tabella
# table_result = t_env.sql_query("SELECT * FROM users LIMIT 10")

# # Esegui la query e stampa i risultati
# table_result.execute().print()

# from pyflink.datastream import StreamExecutionEnvironment
# from pyflink.common import Types
# from pyflink.datastream.connectors.jdbc import JdbcSink
# from pyflink.datastream.connectors.jdbc import JdbcConnectionOptions, JdbcExecutionOptions

# env = StreamExecutionEnvironment.get_execution_environment()
# env.add_jars("file:///opt/flink/usrlib/clickhouse-jdbc-0.7.0.jar")
# env.add_jars("file:///opt/flink/usrlib/flink-connector-jdbc-3.1.2-1.18.jar")



# type_info = Types.ROW([Types.INT(), Types.STRING(), Types.STRING(), Types.INT()])
# env.from_collection(
#     [(101, "Stream Processing with Apache Flink", "Fabian Hueske, Vasiliki Kalavri", 2019),
#      (102, "Streaming Systems", "Tyler Akidau, Slava Chernyak, Reuven Lax", 2018),
#      (103, "Designing Data-Intensive Applications", "Martin Kleppmann", 2017),
#      (104, "Kafka: The Definitive Guide", "Gwen Shapira, Neha Narkhede, Todd Palino", 2017)
#      ], type_info=type_info) \
#     .add_sink(
#     JdbcSink.sink(
#         "insert into books (id, title, authors, year) values (?, ?, ?, ?)",
#         type_info,
#         JdbcConnectionOptions.JdbcConnectionOptionsBuilder()
#             .with_url('jdbc:clickhouse://clickhouse:9000')
#             .with_driver_name('ru.yandex.clickhouse.ClickHouseDriver')
#             .with_user_name('default')
#             .with_password('pass')
#             .build(),
#         JdbcExecutionOptions.builder()
#             .with_batch_interval_ms(1000)
#             .with_batch_size(200)
#             .with_max_retries(5)
#             .build()
#     ))

# env.execute()