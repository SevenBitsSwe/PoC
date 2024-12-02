from clickhouse_driver import Client

#connessione al container clickhouse
client = Client(host='clickhouse',password='pass')
#visualizzazione dei database
client.execute('SHOW DATABASES')
#creazione tabella
#client.command('CREATE TABLE ')
