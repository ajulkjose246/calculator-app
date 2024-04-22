import 'package:calculator/screens/app_info.dart';
import 'package:calculator/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: ({
        '/': (context) => HomeScreen(),
        'appinfo': (context) => appInfo(),
      }),
    );
  }
}
