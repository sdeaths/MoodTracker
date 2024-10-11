import 'package:flutter/material.dart';
import 'package:moodtracker/src/auth.dart';
import 'package:moodtracker/src/moodtracker.dart';
import 'package:moodtracker/src/registration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: RegistrationScreen()
    );
  }
}
