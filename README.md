# Data: Data from the Infodengue project

Começamos com a instalação do PostgreSQL e PostGIS:

```sh
apt install postgresql-10-postgis-2.4
```

## Configurar o PostgreSQL

Editar o arquivo "pg_hba.conf”:

 ```sh
nano /etc/postgresql/10/main/pg_hba.conf
```

Inserir no final do arquivo a linha: 

```sh
	host all all 0.0.0.0/0 md5
```

Editar o arquivo “postgresql.conf”: 

```sh
	nano /etc/postgresql/10/main/postgresql.conf
```

Remover o "#" e substituir "localhost" por "*" na linha "#listen_address “localhost”:

```sh
	listen_address “*”
```

Reiniciar o servidor Postgres:

```sh
	/etc/init.d/postgresql restart
```

## Download da base de dados

Instalar os pacotes:

```sh
apt install git 
apt install git-lfs
git lfs install
```

Realizar a transferencia dos arquivos com o git-lfs:

```sh
git-lfs clone https://github.com/AlertaDengue/Data.git
```

## Restaurar a base de dados

Com o usuário postgres. Acesse o local onde realizou a transferencia dos arquivos e acione a execução do arquivo "restore.sh" para restauração da base de dados:

```sh
su postgres
cd ~/Data
./restore.sh
```

## Configurar a base de dados

Ainda com o usuário postgres. Acesse o "psql" e acione a troca da senha dos usuários: "forecast" e "dengueadmin" para "dengueadmin":

```sh
psql
\password forecast
dengueadmin
\password dengueadmin
dengueadmin
\q
```