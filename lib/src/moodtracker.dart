import 'package:flutter/material.dart';

class MoodTrackerScreen extends StatefulWidget {
  const MoodTrackerScreen({super.key});
  @override
  _MoodTrackerScreenState createState() => _MoodTrackerScreenState();
}
class _MoodTrackerScreenState extends State<MoodTrackerScreen> {
  double _moodValue = 2;
  String getMoodText(double value) {
    if (value <= 1) {
      return 'Ужасное';
    } else if (value <= 2) {
      return 'Плохое';
    } else if (value <= 3) {
      return 'Нейтральное';
    } else if (value <= 4) {
      return 'Хорошее';
    } else {
      return 'Отличное';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Какое у вас настроение?'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Slider(
              value: _moodValue,
              min: 1,
              max: 5,
              divisions: 4,
              label: getMoodText(_moodValue),
              onChanged: (value) {
                setState(() {
                  _moodValue = value;
                });
              },
            ),
            Center(
              child: Text(
                getMoodText(_moodValue),
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Настроение записано')),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Записать'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Перейти к профилю'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Календарь'),
            ),
          ],
        ),
      ),
    );
  }
}
