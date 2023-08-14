DCE = docker compose exec
DEI = docker exec -it

# *****************************
# *      For First Build      *
# *****************************

# .envがなければ生成する
.PHONY: env
env:
	@if [ -e .env ] ; then \
		echo ".env already exists"; \
	else \
		cp .env.example .env; \
	fi

.PHONY: init
init:
	@make build_c
	@make up


# *****************************
# *     Container Controll    *
# *****************************
.PHONY: build_c
build_c:
	docker-compose build --no-cache --force-rm

.PHONY: build
build:
	docker compose build

.PHONY: up
up:
	docker-compose up -d

.PHONY: stop
stop:
	docker-compose stop

.PHONY: down
down:
	docker-compose down --remove-orphans

.PHONY: restart
restart:
	@make down
	@make up

.PHONY: app
app:
	$(DEI) flutter bash

.PHONY: run-web
run-web:
	$(DCE) flutter bash -c "cd workspace && flutter run -d web-server --web-port=8888 --web-hostname 0.0.0.0"

.PHONY: web-build
web-build:
	$(DCE) flutter bash -c "cd workspace && flutter build web"

.PHONY: upgrade
upgrade:
	$(DCE) flutter bash -c "cd workspace && flutter upgrade"

.PHONY: doctor
doctor:
	$(DCE) flutter bash -c "cd workspace && flutter doctor"

