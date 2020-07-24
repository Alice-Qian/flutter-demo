import 'package:flutter/material.dart';
import '../config/config.dart';
import '../main.dart';

void main() {
  Config.env = Env.DEVELOP;
  // 实例化应用
  runApp(new MyApp());
}
