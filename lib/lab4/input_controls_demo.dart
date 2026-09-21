import 'package:flutter/material.dart';

enum StudyMode { online, offline }

class InputControlsDemo extends StatefulWidget {
  const InputControlsDemo({super.key});

  @override
  State<InputControlsDemo> createState() => _InputControlsDemoState();
}

class _InputControlsDemoState extends State<InputControlsDemo> {
  double _sliderValue = 50;
  bool _notificationsEnabled = true;
  StudyMode? _studyMode = StudyMode.online;
  DateTime _selectedDate = DateTime.now();

  Future<void> _pickDate() async {
    // Open the DatePicker and wait for the user to select a date.
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    // The result is null when the user presses Cancel.
    if (pickedDate == null || !mounted) {
      return;
    }

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate =
        '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}';

    final studyModeText = _studyMode == StudyMode.online ? 'Online' : 'Offline';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 2 - Input Widgets'),
        backgroundColor: Colors.lightBlue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Slider value: ${_sliderValue.round()}',
              style: const TextStyle(fontSize: 18),
            ),

            // Update Slider value using setState.
            Slider(
              value: _sliderValue,
              min: 0,
              max: 100,
              divisions: 10,
              label: _sliderValue.round().toString(),
              onChanged: (value) {
                setState(() {
                  _sliderValue = value;
                });
              },
            ),
            const Divider(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Enable notifications',
                  style: TextStyle(fontSize: 18),
                ),

                // Update Switch value using setState.
                Switch(
                  value: _notificationsEnabled,
                  onChanged: (value) {
                    setState(() {
                      _notificationsEnabled = value;
                    });
                  },
                ),
              ],
            ),
            Text(
              _notificationsEnabled
                  ? 'Notifications: ON'
                  : 'Notifications: OFF',
            ),
            const Divider(),
            const Text(
              'Choose study mode:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            // RadioGroup manages all RadioListTile widgets below it.
            RadioGroup<StudyMode>(
              groupValue: _studyMode,
              onChanged: (value) {
                setState(() {
                  _studyMode = value;
                });
              },
              child: const Column(
                children: [
                  RadioListTile<StudyMode>(
                    title: Text('Online'),
                    value: StudyMode.online,
                  ),
                  RadioListTile<StudyMode>(
                    title: Text('Offline'),
                    value: StudyMode.offline,
                  ),
                ],
              ),
            ),
            Text('Selected mode: $studyModeText'),
            const Divider(),
            const SizedBox(height: 8),

            Center(
              child: ElevatedButton.icon(
                onPressed: _pickDate,
                icon: const Icon(Icons.calendar_month),
                label: const Text('Select date'),
              ),
            ),
            const SizedBox(height: 12),

            Center(
              child: Text(
                'Selected date: $formattedDate',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
