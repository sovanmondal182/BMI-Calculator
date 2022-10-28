import 'dart:async';
import 'package:flutter/material.dart';
import 'package:bmi/screens/input_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const InputPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'images/logo.png',
                  width: 150.0,
                  height: 150.0,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const Center(
                  child: Text(
                'BMI Calculator',
                style: TextStyle(
                    color: Color(0xFF18B8EC),
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
              )),
            ],
          )),
    );
  }
}
