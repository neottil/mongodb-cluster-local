Need to add this section on hosts file (C:\Windows\System32\drivers\etc\)

127.0.0.1 mongo1
127.0.0.1 mongo2
127.0.0.1 mongo3

connection string: mongodb://mongo1:27017,mongo2:27018,mongo3:27019/?replicaSet=rs0

To view all node status
docker exec -it mongo1 mongosh --eval 'rs.status().members.map(m => m.name + " -> " + m.stateStr)'
