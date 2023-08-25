import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workspace/models/fish/fish.dart';

// 魚データの状態管理
final fishProvider = StateProvider((ref) {
  return const Fish(
    name: 'マグロ',
    size: 200,
    price: 300,
  );
});