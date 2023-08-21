import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final nicknameProvider = StateProvider<String>((ref) {
  return "ルビードッグ";
});