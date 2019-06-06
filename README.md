# Data: Data from the Infodengue project

## Ubuntu Operating System

Install PostgreSQL 10 and PostGIS:

```sh
apt install postgresql-10-postgis-2.4
```

## Configuring PostgreSQL

Edit the file "pg_hba.conf”:

 ```sh
nano /etc/postgresql/10/main/pg_hba.conf
```

Insert the line at the end of the file: 

```sh
host all all 0.0.0.0/0 md5
```

Edit the file “postgresql.conf”: 

```sh
nano /etc/postgresql/10/main/postgresql.conf
```


in the "connections and authentication" section: Connection Settings. 
Remove "#" and replace "localhost" with "*" in line "#listen_address" localhost ":

```sh
listen_address “*”
```

Restart the Postgres server:

```sh
/etc/init.d/postgresql restart
```

## Download the database

Install: "git" and "git lfs":

```sh
apt install git git-lfs
git lfs install
```

Download the files:

```sh
git-lfs clone https://github.com/AlertaDengue/Data.git
```

## Restore database

With the user postgres.

```sh
su postgres
```

Go to the location where you transferred the files and launch the "restore.sh" file to restore the database:

```sh
cd Data
./restore.sh
```

## Configure the database

Access the "psql" and activate the users password change: "forecast" and "dengueadmin" for "dengueadmin":

```sh
psql
    \password forecast
    dengueadmin
    \password dengueadmin
    dengueadmin
```

Exit "psql":

```sh
\q
```