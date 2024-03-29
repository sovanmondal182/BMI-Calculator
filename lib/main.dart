import 'package:flutter/material.dart';
import 'package:bmi/screens/splash_page.dart';
// import 'package:bmi/screens/input_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade50,
        colorScheme: const ColorScheme.light().copyWith(
          primary: Colors.grey.shade50,
        ),
      ),
      // home: const InputPage(),
      home: const SplashScreen(),
    );
  }
}
