import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workspace/providers/index_provider.dart';
import 'package:workspace/screens/page_a.dart';
import 'package:workspace/screens/page_b.dart';
import 'package:workspace/screens/page_c.dart';


class Root extends ConsumerWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // インデックス
    final index = ref.watch(indexProvider);

    // アイテムたち
    const items = [
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'アイテムA',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'アイテムB',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: 'アイテムC',
      ),
    ];

    // 下のバー
    final bar = BottomNavigationBar(
      items: items, // アイテムたち
      backgroundColor: Colors.red, // バーの背景色
      selectedItemColor: Colors.white, // 選ばれたアイテムの文字色
      unselectedItemColor: Colors.black, // 選ばれていないアイテムの文字色
      currentIndex: index, // インデックス
      onTap: (index) {
        // タップされたとき インデックスを変更する
        ref.read(indexProvider.notifier).state = index;
      },
    );

    // 画面たち
    const pages = [
      PageA(),
      PageB(),
      PageC(),
    ];

    return Scaffold(
      body: pages[index],
      bottomNavigationBar: bar,
    );
  }
}