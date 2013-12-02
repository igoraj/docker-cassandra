#!/bin/bash

echo "Cassandra node configuration:"
echo $CASS_SEEDS
echo $CASS_TOKEN
echo $CASS_LOCAL_IP

HOST=`hostname`
echo "127.0.0.1 $HOST" >> /etc/hosts

/opt/cassandra/bin/cassandra -f

# echo "waiting for thrift"
# until /usr/bin/lsof -i :9160
# do
# 	echo -n .
# 	sleep 1
# done

# echo "applying init scripts"
# for file in /init/*
# do
# 	echo "Applying $file"
#   	/opt/cassandra/bin/cassandra-cli -f "$file"
# done

# # necessary to block to keep the container running
# tail -f /logs/system.log
