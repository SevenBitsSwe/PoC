import clickhouse_connect

# Connessione al server ClickHouse
client = clickhouse_connect.get_client(host='clickhouse', port=8123, username='default', password='')

# Cancellazione delle tabelle esistenti
client.command('DROP TABLE IF EXISTS default.utente;')
client.command('DROP TABLE IF EXISTS default.punto_interesse;')
client.command('DROP TABLE IF EXISTS default.annuncio;')
client.command('DROP TABLE IF EXISTS default.affinita;')
client.command('DROP TABLE IF EXISTS default.interesse;')
client.command('DROP TABLE IF EXISTS default.categoria;')

print("Tabelle esistenti eliminate con successo.")

# Creazione della tabella utente
client.command('''
CREATE TABLE default.utente(
       id UInt32,
       nome String,
       cognome String,
       email String,
       genere String,
       data_nascita Date DEFAULT toDate(now()),
       stato_civile String,
       lon Float64,
       lat Float64,
       timestamp_rilevamento DateTime,
       PRIMARY KEY(id)
) ENGINE = MergeTree()
ORDER BY id;
''')

# Creazione della tabella punto_interesse
client.command('''
CREATE TABLE default.punto_interesse(
       id UInt32,
       nome String,
       lon Float64,
       lat Float64,
       indirizzo String,
       PRIMARY KEY(id)
) ENGINE = MergeTree()
ORDER BY id;
''')

# Creazione della tabella annuncio
client.command('''
CREATE TABLE default.annuncio(
       punto_interesse UInt32,
       utente UInt32,
       timestamp DateTime,
       contenuto String,
       PRIMARY KEY(punto_interesse, utente, timestamp)
) ENGINE = MergeTree()
ORDER BY (punto_interesse, utente, timestamp);
''')

# Creazione della tabella affinità
client.command('''
CREATE TABLE default.affinita(
       categoria String,
       PRIMARY KEY(categoria)
) ENGINE = MergeTree()
ORDER BY (categoria);
''')

# Creazione della tabella interesse
client.command('''
CREATE TABLE default.interesse(
       utente UInt32,
       interesse String,
       PRIMARY KEY(utente, interesse)
) ENGINE = MergeTree()
ORDER BY (utente, interesse);
''')

# Creazione della tabella categoria
client.command('''
CREATE TABLE default.categoria(
       punto_interesse UInt32,
       categoria String,
       PRIMARY KEY(punto_interesse, categoria)
) ENGINE = MergeTree()
ORDER BY (punto_interesse, categoria);
''')

print("Tabelle create con successo.")



# Inserimento di dati nella tabella utente
client.command('''
INSERT INTO default.utente (id, nome, cognome, email, genere, data_nascita, stato_civile, lon, lat, timestamp_rilevamento) VALUES
(1, 'Mario', 'Rossi', 'mario.rossi@example.com', 'M', '1985-05-15', 'Single', 12.4924, 41.8902, now());
''')

# Inserimento di dati nella tabella punto_interesse
client.command('''
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
''')

# Inserimento dati nella tabella affinità
client.command('''
INSERT INTO default.affinita (categoria) VALUES
('Ristorazione'),
('Cultura'),
('Natura'),
('Acquisti'),
('Sport e attività fisica'),
('Intrattenimento'),
('Servizi'),
('Tecnologia'),
('Viaggi'),
('Moda'),
('Salute e Benessere'),
('Famiglia e Società');
''')

# Inserimento nella tabella categoria
client.command('''
INSERT INTO default.categoria (punto_interesse, categoria) VALUES
(1, 'Ristorazione'),
(1, 'Intrattenimento'),
(2, 'Cultura'),
(3, 'Ristorazione'),
(4, 'Servizi'),
(5, 'Cultura'),
(6, 'Natura'),
(7, 'Cultura'),
(8, 'Ristorazione'),
(9, 'Cultura'),
(10, 'Intrattenimento'),
(10, 'Cultura');
''')

# Inserimento nella tabella interessi
client.command('''
INSERT INTO default.interesse (utente, interesse) VALUES
(1, 'Cultura'),
(1, 'Intrattenimento');
''')

print("Dati inseriti nelle tabelle")

print("Popolamento del database completato con successo.")

# Chiudere il client
client.close()

