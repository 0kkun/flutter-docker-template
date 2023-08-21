import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nicknameProvider = StateProvider<String>(
  (ref) {
    return "ルビードッグ";
  }
);

// 状態管理確認用のメソッドたち
tapA(WidgetRef ref) {
  final notifier = ref.read(nicknameProvider.notifier);
  notifier.state = 'ルビーキャット';
}

tapB(WidgetRef ref) {
  final notifier = ref.read(nicknameProvider.notifier);
  notifier.state = 'ルビーバード';
}

tapC(WidgetRef ref) {
  final notifier = ref.read(nicknameProvider.notifier);
  notifier.state = 'ルビーフィッシュ';
}

class Sample extends ConsumerWidget {
  const Sample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // テータを見張っておく
    final nickname = ref.watch(nicknameProvider);

    return Scaffold(
      appBar: AppBar(title: Text(nickname)),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(nickname),
            ElevatedButton(onPressed: () => tapA(ref), child: const Text('A')),
            ElevatedButton(onPressed: () => tapB(ref), child: const Text('B')),
            ElevatedButton(onPressed: () => tapC(ref), child: const Text('C')),
          ]
        )
      )
    );
  }
}