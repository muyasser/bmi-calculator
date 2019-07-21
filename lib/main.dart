import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/input_page.dart';
import 'screens/results_page.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(
    BMICalculator(),
  );
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF090C22),
        accentColor: Colors.purple,
        //canvasColor: Colors.yellow,
        scaffoldBackgroundColor: Color(0xFF090C22),
        textTheme: TextTheme(
          body1: TextStyle(
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
      routes: {
        '/': (context) => InputPage(),
        '/results': (context) => ResultsPage(),
      },
    );
  }
}
