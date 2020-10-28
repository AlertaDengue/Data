##################
## ADD DB PATCH ##
##################

psql -d dengue < docker/patch/update_reg_saude.sql

psql -d dengue < docker/patch/update_hist_alerta.sql
