FROM python:3.11

COPY requirements2.txt .
RUN pip install --no-cache-dir -r requirements2.txt

COPY . /app
WORKDIR /app


CMD [ "python", "producer.py" ]