import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workspace/providers/toggle_provider.dart';

class ToggleScreen extends ConsumerWidget {
  const ToggleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // トグルスイッチ
    final isOn = ref.watch(isOnProvider);
    final toggleSwitch = Switch(
      value: isOn,
      onChanged: (isOn) {
        ref.read(isOnProvider.notifier).state = isOn;
      },
      // 色を変える
      activeColor: Colors.blue,
      activeTrackColor: Colors.green,
      inactiveThumbColor: Colors.black,
      inactiveTrackColor: Colors.grey,
    );

    // スライダー
    final value = ref.watch(valueProvider);
    final slider = Slider(
      value: value,
      onChanged: (value) {
        ref.read(valueProvider.notifier).state = value;
      },
      // 色を変える
      thumbColor: Colors.blue,
      activeColor: Colors.green,
      inactiveColor: Colors.black12,
    );

    // レンジスライダー
    final range = ref.watch(rangeProvider);
    final rangeSlider = RangeSlider(
      values: range,
      onChanged: (value) {
        ref.read(rangeProvider.notifier).state = value;
      },
      // 色を変える
      activeColor: Colors.green,
      inactiveColor: Colors.black12,
    );

    // スライダーを動かすと幅が変わるコンテナ
    final con = Container(
      width: value * 300,
      height: 20,
      color: Colors.blue,
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            toggleSwitch,
            slider,
            rangeSlider,
            con,
          ],
        ),
      ),
    );
  }
}