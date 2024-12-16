CREATE TABLE nearyou.interesseAttivita(
       punto_interesse UInt32,
       categoria String,
       PRIMARY KEY(punto_interesse, categoria)
) ENGINE = MergeTree()
ORDER BY (punto_interesse, categoria);



INSERT INTO nearyou.interesseAttivita (punto_interesse, categoria) VALUES
(1, 'Ristorazione'),
(1, 'Cultura'),
(2, 'Cultura'),
(3, 'Ristorazione'),
(5, 'Cultura'),
(4, 'Sport'),
(6, 'Natura'),
(7, 'Cultura'),
(8, 'Ristorazione'),
(9, 'Cultura'),
(10, 'Cultura');