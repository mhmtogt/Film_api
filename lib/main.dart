import 'package:api_1/home_screen.dart';
import 'package:api_1/theme/colors_app.dart';
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
      title: 'FİİLM ',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colours.backColor,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
