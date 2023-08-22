import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// どのくらい進んだかを表すパーセント
final percentProvider = StateProvider((ref) {
  // 最初は0%からスタート
  return 0.00;
});