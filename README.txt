Need to add this section on hosts file (C:\Windows\System32\drivers\etc\)

127.0.0.1 mongo1
127.0.0.1 mongo2
127.0.0.1 mongo3

connection string: mongodb://mongo1:27017,mongo2:27017,mongo3:27017/?replicaSet=rs0