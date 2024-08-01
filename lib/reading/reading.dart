import 'package:flutter/material.dart';
import 'package:quran/reading/MyWidget.dart/Prayer_Time.dart';
import 'package:quran/reading/MyWidget.dart/Recent_Read.dart';
import 'package:quran/reading/MyWidget.dart/Title.dart';

class reading extends StatefulWidget {
  const reading({super.key});

  @override
  State<reading> createState() => _readingState();
}

class _readingState extends State<reading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 249, 246, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [Reading_Title(), RecentRead(), PrayerTime()],
      ),
    );
  }
}
