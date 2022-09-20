import 'package:drum_kit/constants.dart';
import 'package:drum_kit/widgets/drum_button.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> drumKeys = ['w', 'a', 's', 'd', 'j', 'k', 'l'];
  late Iterable<Widget> drumKeyButtons = [];

  @override
  void initState() {
    super.initState();
    drumKeyButtons = drumKeys.map((drumKeyName) {
      return DrumButton(
        drumKeyName: drumKeyName,
        drumKeyImageSource: drumKeysInfo[drumKeyName]!['image']!,
        onPressed: () async {
          await playAudio(drumKeysInfo[drumKeyName]!['sound']!);
        },
      );
    });
  }

  Future playAudio(String soundSource) async {
    try {
      final player = AudioPlayer();
      await player.setAsset(
        soundSource,
      );

      await player.play();
      player.dispose();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF283149),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Drum Kit',
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: const Color(0xFFDBEDF3),
                        fontSize: 35,
                        shadows: [
                          const Shadow(
                            color: Color(0xFFDA0463),
                            offset: Offset(3, 0),
                          )
                        ]),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Wrap(
                      children: drumKeyButtons.toList(),
                      spacing: 10,
                      runSpacing: 10,
                      alignment: WrapAlignment.center,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
