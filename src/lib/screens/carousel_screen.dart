import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workspace/models/horse.dart';
import 'package:workspace/widjets/horse_card.dart';


/// カードにしたいモデルたち
final models = [
  Horse('ナリタブライアン', 'horse1.png'),
  Horse('スペシャルウィーク', 'horse2.png'),
  Horse('オグリキャップ', 'horse3.png'),
  Horse('サイレンススズカ', 'horse4.png'),
  Horse('トウカイテイオー', 'horse5.png'),
];


// モデル => ウィジェット に変換する関数
Widget modelToWidget(Horse model) {
  // ページの部分
  return Container(
    // カードの周りに 10 ずつスペースを空ける
    padding: const EdgeInsets.all(10),
    // 中身は カード
    child: HorseCard(model: model),
  );
  // カードを使う
}


// ホーム画面
class CarouselScreen extends StatelessWidget {
  const CarouselScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // カルーセル
    final carousel = PageView.builder(
      // カルーセルのコントローラー
      controller: PageController(
        // 左右のカードがどのくらい見えるかのバランスを決める
        viewportFraction: 0.6,
      ),
      // カードの数 = モデルの数
      itemCount: models.length,
      // モデルをWidgetに変換する関数
      itemBuilder: (c, i) => modelToWidget(models[i]),
    );

    // 画面
    return Scaffold(
      // 真ん中
      body: Center(
        // 横長のコンテナ
        child: Container(
          height: 200,
          color: Colors.white,
          child: carousel,
        ),
      ),
    );
  }
}