import 'package:flutter/material.dart';
import 'package:workspace/widjets/season_dropdown.dart';
import 'package:workspace/widjets/season_flower.dart';
import 'package:workspace/widjets/season_time.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class DropdownScreen extends StatelessWidget {
  const DropdownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // ドロップダウン
            SeasonDropdown(),
            // 季節ごとの時間帯
            SeasonTime(),
            // 季節ごとの花
            SeasonFlower(),
          ],
        ),
      ),
    );
  }
}