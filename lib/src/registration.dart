import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';


class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  List<Widget> textFields = [];

  @override
  void initState() {
    super.initState();
    _initializeFields();
  }

  void _initializeFields() {
    if (kIsWeb) {
      textFields = [
        const TextField(
          decoration: InputDecoration(labelText: 'Логин (Web)'),
        ),
        const SizedBox(height: 16),
        const TextField(
          decoration: InputDecoration(labelText: 'Почта (Web)'),
        ),
        const SizedBox(height: 16),
        const TextField(
          decoration: InputDecoration(labelText: 'Пароль (Web)'),
          obscureText: true,
        ),
      ];
    } else if (Platform.isAndroid) {
      textFields = [
        const TextField(
          decoration: InputDecoration(labelText: 'Логин (Android)'),
        ),
        const SizedBox(height: 16),
        const TextField(
          decoration: InputDecoration(labelText: 'Почта (Android)'),
        ),
        const SizedBox(height: 16),
        const TextField(
          decoration: InputDecoration(labelText: 'Пароль (Android)'),
          obscureText: true,
        ),
        const SizedBox(height: 16),
        const TextField(
          decoration: InputDecoration(labelText: 'Телефон (Android)'),
        ),
      ];
    } else {
      textFields = [
        const TextField(
          decoration: InputDecoration(labelText: 'Логин (Desktop/Other)'),
        ),
        const SizedBox(height: 16),
        const TextField(
          decoration: InputDecoration(labelText: 'Почта (Desktop/Other)'),
        ),
        const SizedBox(height: 16),
        const TextField(
          decoration: InputDecoration(labelText: 'Пароль (Desktop/Other)'),
          obscureText: true,
        ),
        const SizedBox(height: 16),
        const TextField(
          decoration: InputDecoration(labelText: 'Компания (Desktop/Other)'),
        ),
      ];
    }
  }

  void _addNewField() {
    setState(() {
      textFields.add(const SizedBox(height: 16));
      textFields.add(
        TextField(
          decoration: InputDecoration(labelText: 'Поле ${textFields.length ~/ 2 + 1}'),
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
        title: Text(_getPlatformSpecificTitle()),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _addNewField,
          ),
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: _removeLastField,
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
              if (Platform.isAndroid)
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Специальная кнопка для Android'),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  String _getPlatformSpecificTitle() {
    if (kIsWeb) {
      return 'Регистрация (Web)';
    } else if (Platform.isAndroid) {
      return 'Регистрация (Android)';
    } else {
      return 'Регистрация (Desktop/Other)';
    }
  }
}