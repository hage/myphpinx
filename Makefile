include .env

COMPOSE=docker-compose

APP_CONTAINER=app

.PHONY: up down stop build force-build dump-db drop-db load-db reset-db sh

up:
	$(COMPOSE) up -d

stop:
	$(COMPOSE) stop

down:
	$(COMPOSE) down

reup:
	$(MAKE) down
	$(MAKE) up

build: down
	$(COMPOSE) build

force-build: down
	$(COMPOSE) build --force-rm

db:
	$(COMPOSE) exec db sh -c 'mysql --host=localhost --user=${MYSQL_USER} --password=$(MYSQL_PASSWORD) $(MYSQL_DATABASE)'

dbroot:
	$(COMPOSE) exec db sh -c 'mysql --host=localhost --user=root --password=$(MYSQL_ROOT_PASSWORD) mysql'

dump-db:
	$(COMPOSE) exec db sh -c "mysqldump --databases $(MYSQL_DATABASE) --add-drop-database -u $(MYSQL_USER) -p$(MYSQL_PASSWORD) 2> /dev/null" > docker-entrypoint-initdb.d/shema.sql

drop-db:
	$(COMPOSE) exec db sh -c "echo 'drop database $(MYSQL_DATABASE);'|mysql -u $(MYSQL_USER) --password=$(MYSQL_PASSWORD) --batch --silent 2>/dev/null"

load-db:
	$(COMPOSE) exec db sh -c "cat docker-entrypoint-initdb.d/schema.sql|mysql -u $(MYSQL_USER) --password=$(MYSQL_PASSWORD) --batch --silent 2>/dev/null"

reset-db: down
	rm -rf docker/db/data

sh:
	$(COMPOSE) exec $(APP_CONTAINER) /bin/sh --login
	@echo " "

dbbash:
	$(COMPOSE) exec db /bin/bash
