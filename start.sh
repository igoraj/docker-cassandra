#!/bin/bash

echo "Cassandra node configuration:"
echo $CASS_SEEDS
echo $CASS_TOKEN
echo $CASS_LOCAL_IP

exec /opt/cassandra/bin/cassandra -f
