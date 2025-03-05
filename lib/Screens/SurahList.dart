import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;

class Surahlist extends StatefulWidget {
  int indexSurah;
   Surahlist({super.key, required this.indexSurah});

  @override
  State<Surahlist> createState() => _SurahlistState();
}

class _SurahlistState extends State<Surahlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(
       children: [
         Expanded(
           child: ListView.builder(itemBuilder: (context , index){
             return ListTile(
               title: Text(quran.getVerse(widget.indexSurah+1 , index+1, verseEndSymbol: true), textAlign: TextAlign.center,),
             );
           }),
         ),
         Card(
           elevation: 6,
           shadowColor: Colors.brown.shade700,
           child: Center(
             child: IconButton(
                 onPressed: onPressed, 
                 icon: Icon(Icons.play) ),
           ),
         )
       ],
     ),
    );
  }
}
