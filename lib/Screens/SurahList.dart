import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;
import 'package:just_audio/just_audio.dart';
import 'package:google_fonts/google_fonts.dart';

class Surahlist extends StatefulWidget {
  int indexSurah;
  Surahlist({super.key, required this.indexSurah});

  @override
  State<Surahlist> createState() => _SurahlistState();
}

class _SurahlistState extends State<Surahlist> {
  AudioPlayer audioPlayer = AudioPlayer();
  IconData playpause = Icons.play_circle_outline_outlined;
  bool isplaying = false;

  Future<void> togglebutton() async {
    try {
      final audio1 = await quran.getAudioURLBySurah(widget.indexSurah + 1);

      audioPlayer.setUrl(audio1);
      if (isplaying) {
        print(audio1);
        audioPlayer.play();
        playpause = Icons.pause_circle_outline_rounded;
        setState(() {});
        isplaying = false;
      } else {
        audioPlayer.pause();
        playpause = Icons.play_circle_outline;
        setState(() {});
        isplaying = true;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quran Nest',
            style: GoogleFonts.luckiestGuy(color: Colors.brown.shade700)),
        backgroundColor: Color(0xFFD7CCC8),
        centerTitle: true,
      ),
      backgroundColor: Colors.brown.shade700,
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(children: [
          Expanded(
            child: Stack(
              children: [
                Expanded(
                  child: ListView.builder(itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(
                          quran.getVerse(widget.indexSurah + 1, index + 1,
                              verseEndSymbol: true),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 570),
                  child: Container(
                    height: 70,
                    child: Card(
                      color: Color(0xFFD7CCC8),
                      elevation: 6,
                      shadowColor: Colors.brown.shade700,
                      child: Center(
                        child: IconButton(
                            onPressed: togglebutton,
                            icon: Icon(
                              playpause,
                              color: Colors.brown.shade700,
                            )),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
