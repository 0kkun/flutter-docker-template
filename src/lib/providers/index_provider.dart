import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final indexProvider = StateProvider((ref) {
  // 変化するデータ 0, 1, 2...
  return 0;
});