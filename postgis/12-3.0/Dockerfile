FROM postgres:12

MAINTAINER Fabiana Zioti <fabi.zioti@gmail.com>

ENV POSTGIS_MAJOR 3
ENV PG_MAJOR 12
# comands tools  (shp2pgsql, raster2pgsql)
ENV POSTGIS_VERSION 3.0.0+dfsg-2~exp1.pgdg100+1


RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR=$POSTGIS_VERSION \
       postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR-scripts=$POSTGIS_VERSION \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /docker-entrypoint-initdb.d

COPY ./initdb-postgis.sh /docker-entrypoint-initdb.d/postgis.sh
