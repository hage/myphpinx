include .env

COMPOSE=docker-compose
DOCKER=docker
GIT=git

APP_CONTAINER=app

.PHONY: up down stop build force-build dump-db drop-db load-db reset-db bash

up:
	$(COMPOSE) up -d

stop:
	$(COMPOSE) stop

down:
	$(COMPOSE) down

build: down
	$(COMPOSE) build

force-build: down
	$(COMPOSE) build --force-rm

db:
	$(COMPOSE) exec db sh -c 'mysql --host=localhost --user=${MYSQL_USER} --password=$(MYSQL_PASSWORD) $(MYSQL_DATABASE)'

dump-db:
	$(COMPOSE) exec db sh -c "mysqldump --databases $(MYSQL_DATABASE) --add-drop-database -u $(MYSQL_USER) -p$(MYSQL_PASSWORD) 2> /dev/null" > docker-entrypoint-initdb.d/shema.sql

drop-db:
	$(COMPOSE) exec db sh -c "echo 'drop database $(MYSQL_DATABASE);'|mysql -u $(MYSQL_USER) --password=$(MYSQL_PASSWORD) --batch --silent 2>/dev/null"

load-db:
	$(COMPOSE) exec db sh -c "cat docker-entrypoint-initdb.d/schema.sql|mysql -u $(MYSQL_USER) --password=$(MYSQL_PASSWORD) --batch --silent 2>/dev/null"

reset-db:
	rm -rf db-data/*

bash:
	$(COMPOSE) exec $(APP_CONTAINER) /bin/bash
