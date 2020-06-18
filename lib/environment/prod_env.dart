import 'package:flutter/material.dart';
import '../config/config.dart';
import '../main.dart';

void main() {
  Config.env = Env.PROD;
  runApp(new MyApp());
}
