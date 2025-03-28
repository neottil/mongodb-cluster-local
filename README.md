# mongodb-cluster-local
Docker compose and script to create mongodb local cluster with 2 nodes

## Infrastrature
This project contains 
- docker-compose.yml
- env.sh

### docker-compose.yml
This cdocker compose file runs 2 instances of mongodb with specific command to compose cluster.

### env.sh
This script runs docker compose to start mongodb instances and run rs.initiate() to init the cluster. Also run rs.status() to verify the status of cluster initialization.

## Usage
Run env.sh script with parameter --op up|down
