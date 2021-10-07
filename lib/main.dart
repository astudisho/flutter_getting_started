import 'package:flutter/material.dart';
import 'package:hello_flutter/screens/bmi_screen.dart';
import 'package:hello_flutter/screens/intro_screen.dart';
import 'package:hello_flutter/screens/weather_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      routes: {
        '/': (context) => const IntroScreen(),
        '/bmi': (context) => const BmiScreen(),
        '/intro': (context) => const IntroScreen(),
        '/weather': (context) => const WeatherScreen(),
      },
      // home: const IntroScreen(),
    );
  }
}
