import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  Future<void> _performRegistration() async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      if (mounted) {
        Navigator.pushNamed(context, '/home');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ошибка регистрации: $e')),
      );
    }
  }

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
                  onPressed: _performRegistration,
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
