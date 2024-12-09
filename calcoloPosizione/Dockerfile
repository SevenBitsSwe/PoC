# Usa un'immagine base Python
FROM python:3.10-slim

# Installazione delle dipendenze di sistema
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Imposta la directory di lavoro nel container
WORKDIR /app

# Copia i file di dipendenze e installa le librerie necessarie
COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copia il resto del codice sorgente nel container
COPY . /app

# Comando predefinito per avviare l'applicazione
CMD ["python", "calcoloPosizione.py"]