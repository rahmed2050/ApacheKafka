#Lancer un cluster kafka avec docker-compose
docker-compose up
#Lancer un shell sous kafka

docker-compose exec kafka bash

#creer un topic covid with replication-factor et partitions

kafka-topics \
--bootstrap-server localhost:9092 \
--create \
--topic covid \
--partitions 4 \
--replication-factor 1
# output
Created topic covid.

#produire des messages avec le topic covid
kafka-console-producer \
--bootstrap-server localhost:9092 \
--property key.separator=, \
--property parse.key=true \
--topic covid
#saisir ces messages 
1, {"Country":"France","Confirmed":650000,"Deaths":152540,"Recovred":546000}
2, {"Country":"Tunisia","Confirmed":105000,"Deaths":5200,"Recovred":77005}
3, {"Country":"Maroc","Confirmed":250000,"Deaths":15000,"Recovred":150000}
4, {"Country":"Algerie","Confirmed":210000,"Deaths":14520,"Recovred":158000}
5, {"Country":"Mali","Confirmed":130000,"Deaths":4500,"Recovred":99000}
6, {"Country":"Italy","Confirmed":250000,"Deaths":65000,"Recovred":150000}

#consommer des messages avec le topic covid avec plus de détails (timestamp, key, value)

kafka-console-consumer \
--bootstrap-server localhost:9092 \
--topic covid \
--property print.timestamp=true \
--property print.key=true \
--property print.value=true \
--from-beginning



