import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart' as quran;
import 'package:quran_nest/Screens/SurahList.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text('Quran Nest', style: GoogleFonts.luckiestGuy(color: Colors.brown.shade700)),
        backgroundColor: Color(0xFFD7CCC8),
        centerTitle: true ,
      ),
      backgroundColor: Colors.brown.shade700,
      body: ListView.builder(
        itemCount:quran.totalSurahCount ,
          itemBuilder: (context , index) {
        return Card(
          
          child: ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Surahlist(indexSurah: 12)));
            },
            title: Text('${quran.getSurahNameEnglish(index+1)}'),
            subtitle: Text('${quran.getSurahNameArabic(index+1)}') ,
            leading: CircleAvatar(
              child: Text("${index+1}", style: GoogleFonts.poppins( color: Colors.white),),
              backgroundColor: Colors.brown.shade700,
            ) ,
            trailing: Text("${quran.getVerseCount(index+1)}"),
          ),
        );
      }),
    );
  }
}
