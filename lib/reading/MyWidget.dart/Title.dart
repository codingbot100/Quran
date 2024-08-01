import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran/reading/MyWidget.dart/DateDisplay.dart';

class Reading_Title extends StatelessWidget {
  const Reading_Title({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      child: Stack(
        // mainAxisAlignment: MainAxisAlignment.center,
        // alignment: Alignment.center,
        children: [
          Container(
              width: double.infinity,
              height: 240,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(31, 149, 106, 1),
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(150)))),
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                      width: 120,
                      height: 120,
                      child: SvgPicture.asset(
                          "assets/BottomNavagation/Quran_lugo.svg")),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 20), child: DateDisplay()),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 225),
              child: Container(
                  width: 159,
                  height: 37,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(31, 149, 106, 0.14),
                            offset: Offset(2, 2),
                            blurRadius: 12,
                            spreadRadius: 0)
                      ]),
                  child: Center(
                      child: Text("ادامه برنامه حفظ",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "YekanBakh",
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(31, 149, 106, 1),
                          )))),
            ),
          )
        ],
      ),
    );
  }
}
