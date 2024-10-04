import 'package:flutter/material.dart';

class MoodTrackerScreen extends StatefulWidget {
  const MoodTrackerScreen({super.key});

  @override
  _MoodTrackerScreenState createState() => _MoodTrackerScreenState();
}

class _MoodTrackerScreenState extends State<MoodTrackerScreen> {
  double _moodValue = 2;
  List<String> moodEntries = [];

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

  void _addMoodEntry() {
    setState(() {
      moodEntries.add(getMoodText(_moodValue));
    });
  }

  void _removeMoodEntry(int index) {
    setState(() {
      moodEntries.removeAt(index);
    });
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
          mainAxisAlignment: MainAxisAlignment.start,
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
                _addMoodEntry();
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
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: moodEntries.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(moodEntries[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _removeMoodEntry(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
