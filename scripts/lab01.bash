#Lancer un cluster kafka avec docker-compose
docker-compose up
#Lancer un shell sous kafka

docker-compose exec kafka bash

#creer un topic users with replication-factor et partitions

kafka-topics \
--bootstrap-server localhost:9092 \
--create \
--topic users \
--partitions 4 \
--replication-factor 1

# output
Created topic users.

#produire des messages avec le topic users
kafka-console-producer \
--bootstrap-server localhost:9092 \
--property key.separator=, \
--property parse.key=true \
--topic users
#consommer des messages avec le topic users

kafka-console-consumer \
--bootstrap-server localhost:9092 \
--topic users \
--from-beginning

#consommer des messages avec le topic users avec plus de détails (timestamp, key, value)

kafka-console-consumer \
--bootstrap-server localhost:9092 \
--topic users \
--property print.timestamp=true \
--property print.key=true \
--property print.value=true \
--from-beginning

