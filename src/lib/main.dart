import 'package:flutter/material.dart';
import 'package:workspace/banana_counter.dart';
import 'dart:developer';
import 'package:logger/logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workspace/sample.dart';

final logger = Logger();

void main() {
  // NOTE: flutterでは全てがwidgetと呼ぶ (Text, Scaffroldなど)
  // NOTE: 変数：基本はconstを使った方がアプリが軽くなる。新しいwidgetを使用する時はconstが使えない時があるので、finalを使う必要がある

  // ******************************************
  // ** Hello world! **
  const app1 = MaterialApp(
    // Scaffold : 画面を作りたい時に使う
    home: Scaffold(
      body: Center(
        child: Text('Hello world!')
      ),
    ),
  );

  // ******************************************
  // ** 要素を並べる **
  // 縦に並べる
  const col = Column(
    // 上下方向の設定
    mainAxisAlignment: MainAxisAlignment.center,
    // 横方向の設定
    crossAxisAlignment: CrossAxisAlignment.center,
    // 余白の設定
    mainAxisSize: MainAxisSize.min,
    // 並べる要素
    children: [
      Text('りんご'),
      Text('レモン'),
      Text('ぶどう'),
    ]
  );

  const app2 = MaterialApp(
    // Scaffold : 画面を作りたい時に使う
    home: Scaffold(
      body: Center(
        child: col
      ),
    ),
  );

  // ******************************************
  // ** 画像の表示 **
  // 2パターンやり方ある
  const chopperImage = AssetImage('images/chopper.jpeg');
  final chopperImage2 = Image.asset('images/chopper.jpeg');

  const col2 = Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image(image: chopperImage),
    ],
  );

  final col3 = Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      chopperImage2,
    ],
  );

  final app3 = MaterialApp(
    home: Scaffold(
      body: Center(
        child: col3
      ),
    ),
  );

  // ******************************************
  // ** コンテナ **
  final testContainer = Container(
    color: Colors.deepOrange,
    width: 500,
    height: 600,
    alignment: Alignment.centerLeft,
    padding: const EdgeInsets.all(20),
    child: const Image(image: chopperImage),
  );

  final app4 = MaterialApp(
    home: Scaffold(
      body: Center(
        child: testContainer
      ),
    ),
  );

  // ******************************************
  // ** ステートレスウィジェット **
  const bananaCounter = BananaCounter(number: 12);

  const app5 = MaterialApp(
    home: Scaffold(
      body: Center(
        child: bananaCounter
      ),
    ),
  );

  // ******************************************
  // ** ボタン **
  // Flat、Raised、Outlineボタンは古いやつなので使わないように！
  // Text、Elevated、Outlinedがある
  test() {
    // print('関数が実行されました');
    // log('関数が実行されました');
    logger.v('関数が実行されました。');
    // logger.d(1000);
    // logger.i(true);
    // logger.w([1, 2, 3]);
    // logger.e({'key': 'key', 'value': 'value'});
    // logger.wtf(Exception('例外もいけます'));
    // logger.i(() => '関数もいけます');
  }

  final button1 = ElevatedButton(
    onPressed: test, // nullにすると押せないボタンになる
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.green,
    ),
      child: const Text('ボタンテスト'),
  );

  final button2 = OutlinedButton(
    onPressed: test,
    child: const Text('ボタンテスト')
  );

  final button3 = TextButton(
    onPressed: test,
    child: const Text('ボタンテスト')
  );


  final app6 = MaterialApp(
    home: Scaffold(
      body: Center(
        child: button1
      ),
    ),
  );

  // ******************************************
  // ** controller **
  final controller = TextEditingController();

  // ** input **
  final textField = TextField(
    controller: controller,
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      hintText: 'カタカナで入力してください',
      labelText: 'あなたの名前',
      errorText: '長すぎます',
    ),
  );

  test2 () {
    logger.v(controller.text);
  }

  final button4 = ElevatedButton(
    onPressed: test2,
    child: const Text('submit'),
  );

  final app7 = MaterialApp(
    home: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 300,
              child: textField,
            ),
            button4,
          ],
        )
      ),
    ),
  );

  // ******************************************
  // ** riberpod **
  // 最新のデータをずれなく表示することができる。状態管理のライブラリ。
  const app8 = MaterialApp(home: Sample());

  // プロバイダースコープで囲む
  const scope = ProviderScope(child: app8);

  // スコープで囲まれたアプリを動かす
  runApp(scope);
}
