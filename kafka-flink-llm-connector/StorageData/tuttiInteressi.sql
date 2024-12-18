CREATE TABLE nearyou.tuttiInteressi(
       categoria String,
       PRIMARY KEY(categoria)
) ENGINE = MergeTree()
ORDER BY (categoria);



INSERT INTO nearyou.tuttiInteressi (categoria) VALUES
('Ristorazione'),
('Cultura'),
('Natura'),
('Sport'),
('Tecnologia'),
('Moda');