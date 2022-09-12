// flutter run -d chrome --web-renderer html
// flutter build web --web-renderer html

import 'package:flutter/material.dart';
import 'src/url_strategy.dart';
import 'src/app.dart';

void main() {
  usePathUrlStrategy();
  runApp(const App());
}
