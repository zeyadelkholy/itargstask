import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioPlayerDemo extends StatefulWidget {
  @override
  _AudioPlayerDemoState createState() => _AudioPlayerDemoState();
}

class _AudioPlayerDemoState extends State<AudioPlayerDemo> {
  AudioPlayer audioPlayer = AudioPlayer();
  String audioUrl = 'file_example_MP3_1MG.mp3';

  IconData playButtonIcon = Icons.play_arrow;
  bool isPlaying = false;

  void toggleAudio() async {
    if (isPlaying) {
      await audioPlayer.pause();
      setState(() {
        playButtonIcon = Icons.play_arrow;
        isPlaying = false;
      });
    } else {
      await audioPlayer.play(audioUrl);
      setState(() {
        playButtonIcon = Icons.pause;
        isPlaying = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}