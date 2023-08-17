import 'package:flutter/material.dart';
import 'package:workspace/banana_counter.dart';

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

  runApp(app5);
}
