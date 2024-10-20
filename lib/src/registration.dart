import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Регистрация'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextField(
                decoration: InputDecoration(labelText: 'Логин'),
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(labelText: 'Почта'),
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(labelText: 'Пароль'),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/moodtracker');
                  },
                  child: const Text('Зарегистрироваться'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
