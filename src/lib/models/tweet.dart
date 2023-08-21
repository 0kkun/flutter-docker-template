import 'package:flutter/material.dart';

class Tweet {
  final String userName;
  final String iconUrl;
  final String text;
  final String createdAt;

  // コンストラクタ
  Tweet(this.userName, this.iconUrl, this.text, this.createdAt);
}