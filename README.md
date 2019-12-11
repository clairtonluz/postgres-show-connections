# postgres-show-connections
Docker image to list amount of connections by user

## Example
```shell
docker run -it \
-e HOST="192.168.2.1" \
-e PORT="5432" \
-e USERNAME="postgres" \
-e PASSWORD="postgres" \
-e DATABASE="postgres" \
clairtonluz/postgres-show-connections
```

# Enviroments default values
```properties
HOST='localhost'
PORT='5432'
USERNAME='postgres'
PASSWORD='postgres'
DATABASE='postgres'
```