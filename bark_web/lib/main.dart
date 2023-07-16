import 'package:url_strategy/url_strategy.dart';
import 'package:bark_web/bark_web.dart';
import 'package:bark_web/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: normal_mode_theme,
      darkTheme: dark_mode_theme,
      themeMode: ThemeMode.light,
      home: const BarkWeb(),
    );
  }
}
