import 'package:flutter/material.dart';
import 'src/url_strategy.dart';
import 'src/app.dart';

void main() {
  usePathUrlStrategy();
  runApp(const App());
}
