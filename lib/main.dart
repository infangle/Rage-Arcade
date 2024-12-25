// main.dart
import 'package:flutter/material.dart';
import 'splashscreen.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  void _toggleAudio() {
    if (_isPlaying) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play(
          'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3'); // Example audio URL
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rage Arcade'),
        actions: [
          IconButton(
            icon: Icon(_isPlaying ? Icons.volume_off : Icons.volume_up),
            onPressed: _toggleAudio,
          ),
        ],
      ),
      body: Center(
        child: Container(
          child: Row(
            children: [Text("data")],
          ),
        ),
      ),
    );
  }
}
