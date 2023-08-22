import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workspace/providers/progress_provider.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProgressScreen extends ConsumerWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final percent = ref.watch(percentProvider);

    // 丸型のインジケーター
    final circular = CircularPercentIndicator(
      percent: percent,
      backgroundColor: Colors.yellow,
      progressColor: Colors.green,
      animation: true, // trueなら滑らかに進むようになる
      animationDuration: 200, // 滑らかさの設定
      animateFromLastPercent: true, // 基本trueで良い
      radius: 60.0, // 円の大きさ
      lineWidth: 20.0, // 円の幅
      center: Text('${percent * 100}%'), // 真ん中に何か表示したい時
    );

    // 棒型のインジケーター
    final linear = LinearPercentIndicator(
      percent: percent,
      backgroundColor: Colors.yellow,
      progressColor: Colors.green,
      animation: true,
      animationDuration: 200,
      animateFromLastPercent: true,
      alignment: MainAxisAlignment.center,
      lineHeight: 20,
      width: 300,
      center: Text('${percent * 100}%'),
    );


    // ボタンを押したときの関数
    void onPressed(WidgetRef ref) async {
      // 1秒まつ
      await Future.delayed(const Duration(seconds: 1));
      // 20%
      ref.read(percentProvider.notifier).state = 0.20;
      // 1秒まつ
      await Future.delayed(const Duration(seconds: 1));
      // 40%
      ref.read(percentProvider.notifier).state = 0.40;
      // 1秒まつ
      await Future.delayed(const Duration(seconds: 1));
      // 60%
      ref.read(percentProvider.notifier).state = 0.60;
      // 1秒まつ
      await Future.delayed(const Duration(seconds: 1));
      // 80%
      ref.read(percentProvider.notifier).state = 0.80;
      // 1秒まつ
      await Future.delayed(const Duration(seconds: 1));
      // 100%
      ref.read(percentProvider.notifier).state = 1.00;
    }

    final button = ElevatedButton(
      onPressed: () => onPressed(ref),
      child: const Text('スタート'),
    );

    // 縦に並べるカラム
    final column = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        circular,
        linear,
        button,
      ],
    );

    return Scaffold(
      body: Center(
        child: column,
      ),
    );
  }
}