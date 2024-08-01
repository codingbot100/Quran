import 'package:flutter/material.dart';

class RecentRead extends StatelessWidget {
  const RecentRead({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30, top: 20),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Text("آخرین آیات تلاوت شده",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "YekanBakh",
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(31, 149, 106, 1),
                )),
          ),
          Container(
            width: double.infinity,
            height: 90,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(top: 12),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Recent_Reveiw("سوره آل عمران", "آیه 89"),
                  );
                }),
          )
        ],
      ),
    );
  }

  Widget Recent_Reveiw(String Surah, Aiya) {
    return IntrinsicWidth(
      stepWidth: 150,
      child: Container(
        // width: 140,
        height: 78,
        padding: EdgeInsets.only(top: 0, right: 15, bottom: 0),
        decoration: BoxDecoration(
          color: Color.fromRGBO(31, 149, 106, 0.12),
          borderRadius: BorderRadius.circular(16),
          // border: Border.all(color: Colors.black, width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(Surah,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "YekanBakh",
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(102, 102, 102, 1),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(Aiya,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "YekanBakh",
                    fontWeight: FontWeight.w800,
                    color: Color.fromRGBO(51, 51, 51, 1),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
