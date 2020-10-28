FROM mdillon/postgis:9.6

RUN apt-get -qq update --yes \
    && apt-get -qq install --yes --no-install-recommends \
    build-essential debconf git make wget\
    ca-certificates locales \
    && rm -rf /var/lib/apt/lists/*

ADD docker/postgres_setup/* /docker-entrypoint-initdb.d/
ADD docker/demo_data docker/demo_data

USER postgres

WORKDIR /Data
