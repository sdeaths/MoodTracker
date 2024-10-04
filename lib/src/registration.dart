import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  List<Widget> textFields = [
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
  ];

  void _addNewField() {
    setState(() {
      textFields.add(const SizedBox(height: 16));
      textFields.add(
        TextField(
          decoration:
              InputDecoration(labelText: 'Поле ${textFields.length ~/ 2 + 1}'),
        ),
      );
    });
  }

  void _removeLastField() {
    setState(() {
      if (textFields.length > 4) {
        textFields.removeRange(textFields.length - 2, textFields.length);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Регистрация'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _addNewField,
          ),
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: _removeLastField,
          ),
          IconButton(
            icon: const Icon(Icons.read_more),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...textFields,
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
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
