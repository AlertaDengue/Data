################
## _create_db.sh
################
#!/bin/bash

dropdb dengue
createdb --owner dengueadmin dengue

dropdb infodengue
createdb --owner dengueadmin infodengue