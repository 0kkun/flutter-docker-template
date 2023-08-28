import 'package:flutter/material.dart';


class StackScreen extends StatelessWidget {
  const StackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final stack = Stack(
      // none: はみ出しても表示する / hardEdge: はみ出したら非表示
      clipBehavior: Clip.none,
      children: [
        // 真ん中のwidjet
        Container(
          margin: const EdgeInsets.all(40),
          color: Colors.blue,
        ),

        // 通知みたいな赤丸を作って重ねる
        Align(
          alignment: Alignment.topRight,
          child: Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );

    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.yellow,
          child: stack,
        ),
      ),
    );
  }
}