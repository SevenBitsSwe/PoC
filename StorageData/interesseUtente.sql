CREATE TABLE nearyou.interesseUtente(
       utente UInt32,
       interesse String,
       PRIMARY KEY(utente, interesse)
) ENGINE = MergeTree()
ORDER BY (utente, interesse);



INSERT INTO nearyou.interesseUtente (utente, interesse) VALUES
(1, 'Sport'),
(1, 'Natura');