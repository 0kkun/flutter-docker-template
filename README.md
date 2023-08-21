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

## ディレクトリ構成

```
  lib/
    main.dart
    providers/
    screens/
      home_screen.dart
      profile_screen.dart
    widgets/
      button_widget.dart
      text_input_widget.dart
    models/
      user.dart
      post.dart
    services/
      api_service.dart
      auth_service.dart
    utils/
      constants.dart
      helpers.dart
  assets/
    images/
      image1.png
      image2.png
  test/
    widget_tests/
      button_widget_test.dart
      text_input_widget_test.dart
    integration_tests/
      api_integration_test.dart
  android/
  ios/
  web/
```