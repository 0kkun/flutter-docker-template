import 'package:flutter/material.dart';


class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DrawerHeader(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.all(0),
          child: Container(
            color: Colors.blue,
            alignment: Alignment.center,
            child: const Text('Drawer Header'),
          ),
        ),
        ListTile(
          title: const Text('ListTile A'),
          onTap: () {
            debugPrint('ListTile Aをタップしました');
          },
        ),
        ListTile(
          title: const Text('ListTile B'),
          onTap: () {
            debugPrint('ListTile Bをタップしました');
          },
        ),
        ListTile(
          title: const Text('ListTile C'),
          onTap: () {
            debugPrint('ListTile Cをタップしました');
          },
        ),
      ],
    );
  }
}