FROM relateiq/oraclejava7

RUN apt-get update
RUN apt-get install -y git curl build-essential make gcc wget lsof

RUN mkdir -p /data /logs /init /opt/cassandra
RUN wget --progress=dot:mega -O - https://s3-us-west-1.amazonaws.com/relateiq-build-resources/apache-cassandra-1.2.10-bin.tar.gz | tar -zx -C /opt/cassandra --strip-components=1

VOLUME [ "/init", "/logs", "/data" ]

EXPOSE 7000 7001 7199 9160 9042

CMD "/opt/cassandra/bin/start.sh"

ADD cassandra.yaml /opt/cassandra/conf/cassandra.yaml
ADD cassandra-env.sh /opt/cassandra/conf/cassandra-env.sh
ADD log4j-server.properties /opt/cassandra/conf/log4j-server.properties
ADD start.sh /opt/cassandra/bin/start.sh
ADD cassandra-topology.properties /opt/cassandra/conf/cassandra-topology.properties