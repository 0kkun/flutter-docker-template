import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GoogleFontPage extends StatelessWidget {
  const GoogleFontPage({super.key});

  @override
  Widget build(BuildContext context) {
    // テキスト
    final text = Text(
      'バナナ美味しい',
      style: GoogleFonts.darumadropOne(
        fontSize: 30,
        fontWeight: FontWeight.w600,
      ),
    );

    // ボタンを押した時の関数
    void onPressed() {
      showLicensePage(context: context);
    }

    // ボタン
    final button = ElevatedButton(
      onPressed: onPressed,
      child: const Text('ボタン'),
    );

    return Scaffold(
      body: Center(
        // カラムで縦に並べる
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            text,
            button,
          ],
        ),
      ),
    );
  }
}