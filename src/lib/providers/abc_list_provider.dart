import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workspace/models/abc_list/abc_list.dart';

// ABCリストの状態管理
final abcListProvider = StateProvider((ref) {
  return AbcList([
    'A',
    'B',
    'C',
  ]);
});