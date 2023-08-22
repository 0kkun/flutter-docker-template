import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isOnProvider = StateProvider((ref) {
  return true;
});

final valueProvider = StateProvider((ref) {
  return 0.0;
});

final rangeProvider = StateProvider((ref) {
  return const RangeValues(0.1, 0.9);
});
