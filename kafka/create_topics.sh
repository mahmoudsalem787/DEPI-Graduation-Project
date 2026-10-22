#!/bin/bash
for t in netflow alerts dlq; do
  docker exec kafka /opt/kafka/bin/kafka-topics.sh \
    --create --if-not-exists --topic $t \
    --bootstrap-server localhost:9092
done
docker exec kafka /opt/kafka/bin/kafka-topics.sh --list --bootstrap-server localhost:9092
