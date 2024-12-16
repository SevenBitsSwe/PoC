CREATE TABLE nearyou.attivita(
       id UInt32,
       nome String,
       lon Float64,
       lat Float64,
       indirizzo String,
       PRIMARY KEY(id)
) ENGINE = MergeTree()
ORDER BY id;



INSERT INTO nearyou.attivita (id, nome, lon, lat, indirizzo) VALUES
(1, 'Caffetteria Roma', 11.8762, 45.4064, 'Via Roma 15, Padova'),
(2, 'Museo Romano', 11.8785, 45.4075, 'Piazza delle Erbe, Padova'),
(3, 'Ristorante La Dolce Vita', 11.8793, 45.4067, 'Via San Francesco 20, Padova'),
(4, 'Palestra Arena', 11.8738, 45.4081, 'Via Venezia 10, Padova'),
(5, 'Galleria di Arte Moderna', 11.8802, 45.4079, 'Piazza Garibaldi 5, Padova'),
(6, 'Parco della Vittoria', 11.8753, 45.4089, 'Viale Codalunga, Padova'),
(7, 'Teatro Romano', 11.8770, 45.4058, 'Piazza Eremitani, Padova'),
(8, 'Pasticceria Romana', 11.8767, 45.4060, 'Via Altinate 12, Padova'),
(9, 'Biblioteca Nazionale', 11.8759, 45.4084, 'Via San Canziano 8, Padova'),
(10, 'Cinema Roma', 11.8746, 45.4070, 'Via Santa Lucia 18, Padova');
