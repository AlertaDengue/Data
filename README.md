# Data for the Infodengue project
<p>

### *The data inserted randomly in the database for testing and development with the AlertaDengue project.*
https://github.com/AlertaDengue/AlertaDengue

<br/>

## Configure the demo database on the local machine *(Linux Ubuntu)*

### Install PostgreSQL 12 and PostGIS:
```sh
$ sudo apt update && sudo apt -y upgrade
$ sudo apt install postgis postgresql-12-postgis-3
```
### Configuring PostgreSQL:
*Adjust PostgreSQL configuration so that remote connections to the database are possible.*
 ```sh
$ sudo echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.3/main/pg_hba.conf
```
*And add ``listen_addresses`` to ``/etc/postgresql/9.3/main/postgresql.conf``*
```sh
$ sudo echo "listen_addresses='*'" >> /etc/postgresql/9.3/main/postgresql.conf
```
*Restart the Postgres server.*
```sh
$ sudo /etc/init.d/postgresql restart
```
### Clone the repository to your local machine:
*Install: "git lfs and clone repo."*
```sh
$ sudo apt install git git-lfs
$ git lfs install
$ git-lfs clone https://github.com/AlertaDengue/Data.git
```
### Restore database:
*Use the user postgres to configure and restore data.*
```sh
$ su postgres
$ cd Data
$ ./restore.sh
```
<br/>

## Deploying Data with Docker
####  Get Docker: 
*https://docs.docker.com/get-docker/*
### Install Docker Compose: 
*https://docs.docker.com/compose/install/*
### Clone the repository to your local machine:
*Install: git lfs and clone repo.*
```sh
$ sudo apt install git git-lfs
$ git lfs install
$ git clone https://github.com/AlertaDengue/Data.git
```
### Build and deploy data to infodengue:
*Build and up the demo_db database.*
```sh
$ cd Data
$ make build
$ make deploy
```
