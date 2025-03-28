#!/bin/bash

print_usage() {
    echo Invalid parameter
    echo "Use env.sh --op up|down"
    exit 1
}

up() {
    echo Start local env...
    docker compose up -d

    echo Init cluster...
    sleep 2
    docker compose exec -it mongodb1 mongosh --eval "rs.initiate({
        _id: \"myReplicaSet\",
        members: [
            {_id: 0, host: \"mongodb1\", priority: 10},
            {_id: 1, host: \"mongodb2\", priority: 1}
        ]
    })"

    echo Verify custer status...
    docker compose exec -it mongodb1 mongosh --eval "rs.status()"
}

down() {
    echo Stop local env...
    docker compose down
}

# Controlla se è stato passato un parametro
if [[ $# -eq 0 ]]; then
    print_usage
fi

# Legge il parametro
while [[ $# -gt 0 ]]; do
    case "$1" in
        --op)
            shift
            case "$1" in
                up)
                    up
                    ;;
                down)
                    down
                    ;;
                *)
                    print_usage
                    ;;
            esac
            shift
            ;;
        *)
            print_usage
            ;;
    esac
done
