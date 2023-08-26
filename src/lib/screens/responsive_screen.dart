import 'package:flutter/material.dart';
import 'package:workspace/services/screen_pod_service.dart';

class ResponsiveScreen extends StatelessWidget {
  const ResponsiveScreen({super.key});



  @override
  Widget build(BuildContext context) {

    final screen = ScreenRef(context).watch(screenProvider);

    String text1;
    if (screen.sizeClass == ScreenSizeClass.phone) {
      text1 = 'これはスマホサイズです';
    } else {
      text1 = 'これはスマホサイズではありません';
    }

    String text2;
    if (screen.orientation == Orientation.portrait) {
      text2 = 'これは縦向きです';
    } else {
      text2 = 'これは縦向きではありません';
    }

    final screenSize = MediaQuery.of(context).size;
    debugPrint('$screenSize');

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // 文字 1
            Text(
              text1,
              style: const TextStyle(fontSize: 20),
            ),
            // 文字 2
            Text(
              text2,
              style: const TextStyle(fontSize: 20),
            ),
            // 色付きコンテナ
            Container(
              color: Colors.orange,
              width: screen.designW(200), // 画面サイズによって変わる大きさ
              height: screen.designH(100),
            ),
          ],
        ),
      ),
    );
  }
}