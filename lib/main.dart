import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const XyloPhoneApp());
}

class XyloPhoneApp extends StatelessWidget {
  const XyloPhoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(child: PlaySound()),
        ),
      ),
    );
  }
}

// Designing For Text Button General Properties.
final ButtonStyle flatButtonStyle = TextButton.styleFrom(
  backgroundColor: Colors.white,
  minimumSize: const Size(88, 75),
  padding: const EdgeInsets.symmetric(horizontal: 16.0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2.0)),
  ),
);

class PlaySound extends StatefulWidget {
  const PlaySound({super.key});

  @override
  State<PlaySound> createState() => _PlaySoundState();
}

class _PlaySoundState extends State<PlaySound> {
  void playFile(int soundNumber) {
    setState(() {
      final player = AudioPlayer();
      player.play(AssetSource('note$soundNumber.wav'));
    });
  }

  Expanded buildKey({required Color color, required int soundNumber}) {
    return Expanded(
      child: FilledButton(
        style: FilledButton.styleFrom(
            backgroundColor: color,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(2.0)))),
        onPressed: () {
          playFile(soundNumber);
        },
        child: const Text('TAP HERE'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        buildKey(color: Colors.red, soundNumber: 1),
        buildKey(color: Colors.orange, soundNumber: 2),
        buildKey(color: Colors.yellow, soundNumber: 3),
        buildKey(color: Colors.green, soundNumber: 4),
        buildKey(color: Colors.teal, soundNumber: 5),
        buildKey(color: Colors.blue, soundNumber: 6),
        buildKey(color: Colors.purple, soundNumber: 7),
      ],
    );
  }
}
