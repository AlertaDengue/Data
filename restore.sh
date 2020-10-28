#!/bin/bash

#############
## restore.sh
#############

# Create roles
./_prepare_server.sh

# Download datafiles from Dataverse
./_download_db.sh

# Create and restore database
./docker/postgres_setup/01-create_dengue_db.sh
./docker/postgres_setup/01-create_infodengue_db.sh

# Update tables
./docker/postgres_setup/02-add_patch.sh
