CREATE TABLE nearyou.punto_interesse(
       id UInt32,
       nome String,
       lon Float64,
       lat Float64,
       indirizzo String,
       PRIMARY KEY(id)
) ENGINE = MergeTree()
ORDER BY id;



INSERT INTO nearyou.punto_interesse (id, nome, lon, lat, indirizzo) VALUES
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
