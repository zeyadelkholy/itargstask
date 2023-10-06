import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:itargstask/constants/app_localization.dart';

import '../constants/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool chandeicon1 = false;
  bool chandeicon2 = false;
  bool chandeicon3 = false;
  bool chandeicon4 = false;

  AudioPlayer audioPlayer = AudioPlayer();
  String audiofile = 'file_example_MP3_1MG.mp3';

  bool isPlaying = false;

  void toggleAudio() async {
    if (isPlaying) {
      await audioPlayer.pause();
    } else {
      await audioPlayer.play(audiofile);
    }

    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: AppLocalizations.of(context)!.translate("This is App  key "),
          fontWeight: FontWeight.bold,
          color: Colors.black,
          size: 25,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: CustomText(
                text: AppLocalizations.of(context)!
                    .translate("Top Likes key"),
                fontWeight: FontWeight.bold,
                size: 20),
          ),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              children: [
                const CustomText(
                  text: 'text1',
                  size: 20,
                ),
                const Spacer(),
                IconButton(
                    icon: ImageIcon(chandeicon1
                        ? const AssetImage('assets/Like.png')
                        : const AssetImage('assets/Like_FIlled.png')),
                    onPressed: () {
                      setState(() {
                        chandeicon1 = !chandeicon1;
                      });
                    }),
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              children: [
                const CustomText(
                  text: 'text2',
                  size: 20,
                ),
                const Spacer(),
                IconButton(
                    icon: ImageIcon(chandeicon2
                        ? const AssetImage('assets/Like.png')
                        : const AssetImage('assets/Like_FIlled.png')),
                    onPressed: () {
                      setState(() {
                        chandeicon2 = !chandeicon2;
                      });
                    }),
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              children: [
                const CustomText(
                  text: 'text3',
                  size: 20,
                ),
                const Spacer(),
                IconButton(
                    icon: ImageIcon(chandeicon3
                        ? const AssetImage('assets/Like.png')
                        : const AssetImage('assets/Like_FIlled.png')),
                    onPressed: () {
                      setState(() {
                        chandeicon3 = !chandeicon3;
                      });
                    }),
              ],
            ),
          ),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: CustomText(
                text: AppLocalizations.of(context)!
                    .translate("Top Likes key"), fontWeight: FontWeight.bold, size: 20),
          ),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              children: [
                IconButton(
                    icon: ImageIcon(chandeicon4
                        ? const AssetImage('assets/Pause@2x.png')
                        : const AssetImage('assets/icPlay Copy@2x.png')),
                    onPressed: () {
                      final player = AudioCache();
                      player.play('file_example_MP3_1MG.mp3');
                      setState(() {
                        chandeicon4 = !chandeicon4;
                      });
                    }),
                 CustomText(
                  text: AppLocalizations.of(context)!
                      .translate("Play this key"),
                  size: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
