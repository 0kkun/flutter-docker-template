import 'package:flutter/material.dart';

// NOTE: 「stless」と打つと以下が出てくる！
class BananaCounter extends StatelessWidget {
  final int number; // 引数として受け取る変数

  // コンストラクタ
  const BananaCounter({Key? key, required this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 表示画像
    final bananaImage = Image.asset('images/banana.jpeg');

    // 表示テキスト
    final text = Text(
      '$number',
      style: const TextStyle(
        fontSize: 16,
        color: Colors.yellow,
      ),
    );

    // 横方向に並べる
    final row = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        bananaImage,
        text,
      ],
    );

    final bananaContainer = Container(
      width: 150,
      height: 80,
      // 背景と角丸の設定
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      child: row,
    );

    return bananaContainer;
  }
}