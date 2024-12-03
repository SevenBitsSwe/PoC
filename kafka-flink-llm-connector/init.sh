#!/usr/bin/bash


clickhouse-client --password="pass" --query="CREATE DATABASE IF NOT EXISTS user_database;"
clickhouse-client --password="pass" --query="USE user_database;"

 clickhouse-client --password="pass" --query="
 CREATE TABLE IF NOT EXISTS user (
    id INT PRIMARY KEY,    
    nome VARCHAR(100) NOT NULL,   
    cognome VARCHAR(100) NOT NULL,
    eta INT NOT NULL,            
    sesso ENUM('M', 'F', 'Altro')
);"

clickhouse-client --password="pass" --query="
INSERT INTO user (id, nome, cognome, eta, sesso) VALUES
(1, 'Mario', 'Rossi', 30, 'M');"

