# コンテナ内でコマンドを打ちたい時に使用
# 

# **********************************
# * Flutter Controll(In Container) *
# **********************************
.PHONY: run-web
run-web:
	@make clean
	@make pub-get
	@make run

.PHONY: web-build
web-build:
	fvm flutter build web

.PHONY: upgrade
upgrade:
	fvm flutter upgrade

.PHONY: doctor
doctor:
	fvm flutter doctor

.PHONY: run
run:
	fvm flutter run -d web-server --web-port=8888 --web-hostname 0.0.0.0

.PHONY: clean
clean:
	fvm flutter clean

.PHONY: pub-get
pub-get:
	fvm flutter pub get

# riverpod、freezed、envied全て同じコマンド
.PHONY: build-runner
build-runner:
	fvm flutter pub run build_runner build --delete-conflicting-outputs