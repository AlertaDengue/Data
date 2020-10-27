# Data for the Infodengue project
<p>

### *The data is randomly inserted into the database for testing and development of the AlertDengue project.*
https://github.com/AlertaDengue/AlertaDengue

<br/>

## Configure the demo database on the local machine *(Linux Ubuntu)*

### Install PostgreSQL 12 and PostGIS:
```sh
$ sudo apt update && sudo apt -y upgrade
$ sudo apt-get install build-essential git make wget \
    postgresql-12 postgresql-12-postgis-3 \
    ca-certificates locales --no-install-recommends --yes
```
### Configuring PostgreSQL:
*Adjust PostgreSQL configuration so that remote connections to the database are possible.*
 ```sh
$ sudo echo "host   all     all     0.0.0.0/0       md5" >> /etc/postgresql/12/main/pg_hba.conf
```
*And add ``listen_addresses`` to ``/etc/postgresql/12/main/postgresql.conf``*
```sh
$ sudo echo "listen_addresses = '*'" >> /etc/postgresql/12/main/postgresql.conf
```
*Restart the Postgres server.*
```sh
$ sudo /etc/init.d/postgresql restart
```
*Clone the repository to your local machine."*
```sh
$ git clone https://github.com/AlertaDengue/Data.git
```
### Download and restore database from Dataverse:
*Download and save datafiles in /Data/docker/demo_data/*
```sh
$ su postgres
$ cd Data
$ make create_demodb
```
</p>

## Deploying Data with Docker
### Update and install essentials:
```sh
$ sudo apt update && sudo apt -y upgrade
$ sudo apt-get install build-essential git make wget
```
###  Get Docker:
*https://docs.docker.com/engine/install/ubuntu/*
### Install Docker Compose: 
*https://docs.docker.com/compose/install/*
### Clone the repository to your local machine:
```sh
$ git clone https://github.com/AlertaDengue/Data.git
```
### Build and deploy data to infodengue:
```sh
$ cd Data/
$ make download_demodb
$ make build
$ make deploy
```
Note:
- *Use the user postgres to configure and restore data in localhost.*
- *The image used by the dockerfile is mdillon/postgis:9.6*

