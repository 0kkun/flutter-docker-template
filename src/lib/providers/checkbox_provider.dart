import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// 選ばれたラジオボタンID
final radioIdProvider = StateProvider<String?>((ref) {
  // 最初はどれも選ばれていないので null
  return null;
});

// 選ばれたチェックボックスIDたち
final checkedIdsProvider = StateProvider<Set<String>>((ref) {
  // 最初は空っぽ {}
  return {};
});