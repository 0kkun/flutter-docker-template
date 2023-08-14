## 概要

dockerを用いたflutterの開発環境テンプレート

## 構築手順

```
make init
```

## アプリ新規作成

- コンテナビルド・立ち上げ
```
make init
```

- コンテナに入る
```
make app
```

- flutterアプリを作成
```
cd ${APP_CODE_PATH_CONTAINER}
flutter create .
```

アクセス可能になる： http://localhost:8888


## その他

- Flutterをアップグレードする場合
```
flutter upgrade
```

- Webをビルドする場合
```
flutter build web
```

- 設定できているか確認
```
$ flutter doctor
```
