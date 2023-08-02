import 'package:api_1/core/extensions/responsive.dart';
import 'package:api_1/features/home_screen.dart';
import 'package:api_1/core/theme/colors_app.dart';
import 'package:flutter/material.dart';

void main() {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  


  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FİLM ',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colours.backColor,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
