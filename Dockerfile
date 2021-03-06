FROM relateiq/oracle-java7

RUN apt-get update
RUN apt-get install -y wget

RUN mkdir -p /data /logs /init /opt/cassandra
RUN wget --no-check-certificate --progress=dot:mega -O - http://www.eu.apache.org/dist/cassandra/2.1.2/apache-cassandra-2.1.2-bin.tar.gz | tar -zx -C /opt/cassandra --strip-components=1

EXPOSE 7000 7001 7199 9160 9042

CMD "/opt/cassandra/bin/start.sh"

ADD cassandra.yaml /opt/cassandra/conf/cassandra.yaml
ADD cassandra-env.sh /opt/cassandra/conf/cassandra-env.sh
ADD log4j-server.properties /opt/cassandra/conf/log4j-server.properties
ADD start.sh /opt/cassandra/bin/start.sh
ADD cassandra-topology.properties /opt/cassandra/conf/cassandra-topology.properties
