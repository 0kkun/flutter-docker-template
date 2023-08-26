import 'package:flutter/material.dart';
import 'package:workspace/widjets/accordion_widjet.dart';

/// ホーム画面
class AccordionScreen extends StatelessWidget {
  const AccordionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // アコーディオンを縦に並べるカラム
    final column = Column(
      children: [
        // バナナのアコーディオン
        Accordion(
          title: 'バナナ',
          headColor: Colors.orange,
          bodyColor: Colors.orange.shade200,
          imageName: 'assets/images/banana.png',
        ),
        // リンゴのアコーディオン
        Accordion(
          title: 'リンゴ',
          headColor: Colors.red,
          bodyColor: Colors.red.shade200,
          imageName: 'assets/images/apple.png',
        ),
        // メロンのアコーディオン
        Accordion(
          title: 'メロン',
          headColor: Colors.green,
          bodyColor: Colors.green.shade200,
          imageName: 'assets/images/melon.png',
        ),
        // ブドウのアコーディオン
        Accordion(
          title: 'ブドウ',
          headColor: Colors.indigo,
          bodyColor: Colors.indigo.shade200,
          imageName: 'assets/images/grape.png',
        ),
      ],
    );

    // 画面
    return Scaffold(
      // 画面をはみ出したらスクロールできるようにする
      body: SingleChildScrollView(
        // 上で作ったカラム
        child: column,
      ),
    );
  }
}