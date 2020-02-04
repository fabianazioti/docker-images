FROM ubuntu:18.04
MAINTAINER Fabiana Zioti <fabi.zioti@gmail.com>

RUN apt-get update \
    && apt-get install -y lsb-release wget vim gnupg2

RUN echo "deb http://apt.postgresql.org/pub/repos/apt/  $(lsb_release -c -s)-pgdg main" >> /etc/apt/sources.list.d/pgdg.list  \
    && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y postgresql-client-12 postgresql-common postgresql-12 postgresql-12-postgis-3 postgis

# Allow connections from anywhere.
RUN sed -i -e"s/^#listen_addresses =.*$/listen_addresses = '*'/" /etc/postgresql/12/main/postgresql.conf
RUN echo "host    all    all    0.0.0.0/0    md5" >> /etc/postgresql/12/main/pg_hba.conf


ADD run.sh /run.sh
RUN chmod +x /run.sh


EXPOSE 5432
