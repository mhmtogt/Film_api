import 'package:api_1/core/extensions/screen_size.dart';
import 'package:api_1/features/screens/home_screen.dart';
import 'package:api_1/core/theme/colors_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize().screenSize = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FİLM ',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colours.backColor,
      ),
      home: const HomeScreen(),
    );
  }
}
