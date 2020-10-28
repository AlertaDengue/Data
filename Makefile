# Deploy production and staging
# note: --env-file requires docker-compose>=1.25
#       ref: https://github.com/docker/compose/pull/6535

include $(ENVFILE)
export

# docker specific
COMPOSE_FILE := docker/docker-compose.yml
DOCKER := PYTHON_VERSION=$(PYTHON_VERSION) docker-compose -f $(COMPOSE_FILE)
DOCKER_UP := $(DOCKER) up
DOCKER_RUN := $(DOCKER) run --rm
DOCKER_BUILD := $(DOCKER) build
DOCKER_STOP := $(DOCKER) rm --force --stop
DOCKER_EXEC := $(DOCKER) exec
SERVICES := demo_db


# Create roles
download_demodb:
	bash _download_db.sh

# Create a local database and execute the patches
create_demodb:
	bash restore.sh

# Configure database in the container
build:
	$(DOCKER_BUILD)

deploy:
	$(DOCKER_UP) -d

exec: deploy
	$(DOCKER_EXEC) $(SERVICES) bash


clean:
	@find ./ -name '*.pyc' -exec rm -f {} \;
	@find ./ -name '*.pyo' -exec rm -f {} \;
	@find ./ -name '*~' -exec rm -f {} \;
	rm -rf .cache
	rm -rf build
	rm -rf dist
	rm -rf *.egg-info
