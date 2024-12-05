CREATE TABLE nearyou.utente(
       id UInt32,
       nome String,
       cognome String,
       email String,
       genere String,
       data_nascita Date DEFAULT toDate(now()),
       stato_civile String,
       PRIMARY KEY(id)
) ENGINE = MergeTree()
ORDER BY id;



INSERT INTO nearyou.utente (id, nome, cognome, email, genere, data_nascita, stato_civile) VALUES
(1, 'Mario', 'Rossi', 'mario.rossi@example.com', 'M', '1985-05-15', 'Single');"
