FROM python:3.8

# Installa solo librerie minime necessarie
RUN apt-get update && apt-get install -y \
  gdal-bin \
  libgdal-dev \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

# Imposta le variabili di ambiente per GDAL
ENV CPLUS_INCLUDE_PATH=/usr/include/gdal
ENV C_INCLUDE_PATH=/usr/include/gdal
ENV GDAL_VERSION=3.10.0

# Aggiorna pip e installa le dipendenze
RUN pip install --upgrade pip

# Copia e installa le dipendenze Python
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copia il codice e imposta la directory di lavoro
COPY . /app
WORKDIR /app

CMD ["python", "simulatePosition.py"]