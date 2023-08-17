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
	@make clean
	@make pub-get
	@make run

.PHONY: web-build
web-build:
	$(DCE) flutter bash -c "fvm flutter build web"

.PHONY: upgrade
upgrade:
	$(DCE) flutter bash -c "fvm flutter upgrade"

.PHONY: doctor
doctor:
	$(DCE) flutter bash -c "fvm flutter doctor"

.PHONY: run
run:
	$(DCE) flutter bash -c "fvm flutter run -d web-server --web-port=8888 --web-hostname 0.0.0.0"

.PHONY: clean
clean:
	$(DCE) flutter bash -c "fvm flutter clean"

.PHONY: pub-get
pub-get:
	$(DCE) flutter bash -c "fvm flutter pub get"

# ローカルでライブラリが参照できない場合は以下を実行する
.PHONY: pubget
pubget:
	cd src && fvm flutter pub get