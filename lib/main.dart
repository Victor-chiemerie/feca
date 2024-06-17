import 'package:feca/firebase_options.dart';
import 'package:feca/pages/welcome_page1.dart';
import 'package:feca/services/auth/auth_gate.dart';
import 'package:feca/themes/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
