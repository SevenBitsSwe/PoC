# NearYou - Sistema di Notifiche Personalizzate basate sulla Posizione

Questo proof-of-concept implementa una piattaforma per l'invio di notifiche pubblicitarie personalizzate basate sulla posizione dell'utente, sui suoi interessi e sui punti di interesse nelle vicinanze. Il sistema utilizza Apache Kafka, Apache Flink, ClickHouse e un Large Language Model (LLM) per creare un'esperienza personalizzata in tempo reale.

## Architettura del Sistema

Il sistema è composto da diversi microservizi containerizzati che comunicano tra loro:

- Un simulatore di posizione che genera dati GPS
- Un controller Flink che elabora i dati di posizione, li arricchisce con dati contestuali e genera messaggi personalizzati
- Un database ClickHouse per memorizzare dati storici e configurazioni
- Un servizio di visualizzazione Grafana per monitorare il sistema
- Un modello LLM (Gemma2-9b-it tramite Groq) che genera messaggi pubblicitari personalizzati

## Struttura del Progetto

### FlinkController/
Contiene l'applicazione Apache Flink che processa i dati di posizione e genera notifiche personalizzate:
- `flinkjob.py`: Job Flink principale che elabora i dati di posizione, interroga il database e il LLM
- `dbflink.py`: Gestisce le connessioni al database ClickHouse
- `provagroq.py`: Implementazione delle chiamate al servizio LLM (Groq)
- `Dockerfile`: Configurazione per creare il container Docker del controller Flink

### SimulatePositions/
Implementa un simulatore di posizioni GPS per testare il sistema:
- `simulatePosition.py`: Genera coordinate GPS che simulano uno spostamento su un percorso urbano
- `percorso.gpx`: File di traccia GPS per simulare percorsi predefiniti
- `Dockerfile`: Configurazione per creare il container Docker del simulatore di posizioni

### StorageData/
Contiene schemi e script per inizializzare il database ClickHouse:
- `positionFromSimulator.sql`: Schema per memorizzare le posizioni degli utenti
- `attivita.sql`: Schema per memorizzare informazioni sulle attività commerciali
- `utente.sql`: Schema per memorizzare i profili utente
- `interesseUtente.sql`: Schema per memorizzare gli interessi degli utenti
- `tuttiInteressi.sql`: Schema per memorizzare tutti i possibili interessi
- `messagefromLLM.sql`: Schema per memorizzare i messaggi generati dal LLM

### Grafana/
Configurazione di Grafana per la visualizzazione dei dati:
- `Dashboards/`: Contiene le dashboard preconfigurate
  - `mappa.json`: Dashboard per visualizzare le posizioni su una mappa
  - `mappaSpec.json`: Specifiche dettagliate per la dashboard della mappa
- `DashboardProv/`: Configurazione per il provisioning automatico delle dashboard
- `DatasourceProv/`: Configurazione per il provisioning automatico delle fonti di dati

### pointInterestGen/
Strumenti per generare e gestire i punti di interesse:
- `gen.py`: Script per generare punti di interesse di esempio

## Come avviare il progetto

Il progetto utilizza Docker Compose per orchestrare tutti i servizi. Per avviare l'intero sistema:

```bash
docker-compose up -d
```

Una volta avviato:
1. I servizi Kafka, Zookeeper e ClickHouse inizieranno per primi
2. Il simulatore di posizioni inizierà a inviare dati GPS al topic Kafka "SimulatorPosition"
3. Il controller Flink elaborerà i dati e genererà messaggi personalizzati
4. I messaggi generati verranno inviati al topic Kafka "MessageElaborated"
5. Le dashboard Grafana saranno accessibili all'indirizzo http://localhost:3000 (utente: admin, password: admin)

## Requisiti

- Docker e Docker Compose
- Chiave API per il servizio Groq (da configurare in un file .env)