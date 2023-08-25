import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workspace/providers/fish_provider.dart';
import 'package:workspace/providers/abc_list_provider.dart';


// ホーム画面
class FreezedScreen extends ConsumerWidget {
  const FreezedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 魚データ
    final fish = ref.watch(fishProvider);
    // ABCリスト
    final abcList = ref.watch(abcListProvider);

    // 名前テキスト
    final nameText = Text(
      '名前: ${fish.name}',
    );

    // 大きさテキスト
    final sizeText = Text(
      '大きさ: ${fish.size} cm',
    );

    // 値段テキスト
    final priceText = Text(
      '値段: ${fish.price} 万円',
    );

    // ABCリストテキスト
    final abcListText = Text(
      'ABCリスト: $abcList',
    );

    // ボタン
    final button = ElevatedButton(
      onPressed: () => onPressed(ref),
      child: const Text('変更する'),
    );

    // 縦に並べるカラム
    final column = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        nameText,
        sizeText,
        priceText,
        abcListText,
        button,
      ],
    );

    // 画面の真ん中にカラムを置く
    return Scaffold(
      body: Center(
        child: column,
      ),
    );
  }

  // ボタンを押したときの関数
  void onPressed(WidgetRef ref) {
    // 今画面に出ている魚
    final fish = ref.read(fishProvider);

    // 入れ物ごと変えた 新しい魚
    final newFish = fish.copyWith(
      // 値段は 500 にする
      price: 500,
    );

    // 画面を変更する
    ref.read(fishProvider.notifier).state = newFish;

    // --- --- --- ---

    // 今画面に出ているABCリスト
    final abcList = ref.read(abcListProvider);

    // 入れ物ごと変えた 新しいABCリスト
    final newAbcList = abcList.copyWith(
      // D を追加する
      values: abcList.values + ['D'],
    );

    // 画面を変更する
    ref.read(abcListProvider.notifier).state = newAbcList;
  }
}