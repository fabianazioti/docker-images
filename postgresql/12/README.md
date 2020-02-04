# PostgreSQL e PostGIS

> Fonte: https://github.com/kartoza/docker-postgis

Versões utilizadas:
- Ubuntu Bionic (18.04 LTS)
- PostgreSQL 12
- PostGIS 3


### Tutorial:

Build image:

```sh
docker build -t fzioti/postgresql:12.0 .
```

Create volume and network:

```sh
docker volume create geo_pg_vol

docker network create geodatabase_net
```

Run the PostgreSQL container with PostGIS extension:

```sh
docker run -itd --net=geodatabase_net \
              --publish 5432:5432 \
              --volume geo_pg_vol:/var/lib/postgresql/data \
              --volume $HOME/geodatabase:/data \
              --env POSTGRES_PASSWORD=colocarsenha \
              --name geodatabase \
              --ipc=host \
              --shm-size 128m \
              fzioti/postgresql:12.0
```

Run init script:

```sh
docker exec -it geodatabase ./run.sh
```

Acessing PostgreSQL:

```sh
docker exec -it geodatabase psql -U postgres -h localhost -p 5432
```

Now can use ...

```sql

CREATE DATABASE geodatabase;

\c geodatabase

CREATE EXTENSION postgis;

```
