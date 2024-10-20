import 'package:flutter/material.dart';
import 'package:moodtracker/src/auth.dart';
import 'package:moodtracker/src/registration.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mood Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthScreen(),
        '/registration': (context) => const RegistrationScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
