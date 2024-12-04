FROM apache/flink:1.18.1-scala_2.12-java11


# install python e pip
RUN apt-get update -y && \
apt-get install -y python3 python3-pip python3-dev && rm -rf /var/lib/apt/lists/*
RUN ln -s /usr/bin/python3 /usr/bin/python

# install required requirements anche se li ho chiamati con un altro file

COPY requirements.txt ./requirements.txt
RUN pip install -U pip
RUN pip install -r requirements.txt

# SCarica connettore kafka flink
RUN mkdir -p /opt/flink/usrlib
RUN wget -P /opt/flink/usrlib https://repo.maven.apache.org/maven2/org/apache/flink/flink-sql-connector-kafka/3.2.0-1.18/flink-sql-connector-kafka-3.2.0-1.18.jar
RUN wget -P /opt/flink/usrlib https://repo1.maven.org/maven2/com/clickhouse/clickhouse-jdbc/0.7.0/clickhouse-jdbc-0.7.0.jar 

RUN wget -P /opt/flink/usrlib https://repo1.maven.org/maven2/org/apache/flink/flink-connector-jdbc/3.1.2-1.18/flink-connector-jdbc-3.1.2-1.18.jar

COPY . /app

WORKDIR /app

CMD [ "python", "flinkjob.py" ]