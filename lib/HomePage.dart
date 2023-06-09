import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class RandomTextScreen extends StatefulWidget {
  const RandomTextScreen({super.key});

  @override
  _RandomTextScreenState createState() => _RandomTextScreenState();
}

class _RandomTextScreenState extends State<RandomTextScreen> {
  late Timer _timer;
  String _randomText = '';

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 15), (timer) {
      setState(() {
        _randomText = _generateRandomText();
      });
    });
  }

  String _generateRandomText() {
    final random = Random();
    List<String> texts = [
      'Hello!',
      'Welcome!',
      'Flutter is awesome!',
      'Have a great day!',
      'PayTM is a fantastic app!',
      'Keep smiling!'
    ];
    return texts[random.nextInt(texts.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo, // Set the AppBar background color
        title: const Text(
          'Bring Back Plastics',
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: "Roboto"),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.purple,
              Colors.blue
            ], // Set the background gradient colors
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _randomText,
                style: const TextStyle(
                    fontSize: 24, color: Colors.white), // Set the text color
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Restart the timer
                  _timer.cancel();
                  _startTimer();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.indigo, // Set the button background color
                ),
                child: const Text(
                  'Restart Timer',
                  style: TextStyle(fontFamily: "Segeo UI"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
