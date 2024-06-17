import 'package:feca/pages/welcome_page1.dart';
import 'package:feca/themes/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FECA',
      home: const WelcomePage1(),
      theme: lightMode,
    );
  }
}
