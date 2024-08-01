import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran/Audio/Audio.dart';
import 'package:quran/reading/reading.dart';
import 'package:quran/Interpretations/Interpretations.dart';
import 'package:quran/MainPage/MainPage.dart';
import 'package:quran/Setting/Setting.dart';
import 'package:quran/Tools/Colors.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BottomNavgation(),
    );
  }
}

class BottomNavgation extends StatefulWidget {
  const BottomNavgation({super.key});

  @override
  State<BottomNavgation> createState() => _BottomNavgationState();
}

class _BottomNavgationState extends State<BottomNavgation> {
  int _currentIndex = 0;
  late List<Widget> buildScreens;
  @override
  void initState() {
    super.initState();
    buildScreens = [
      reading(),
      Audio(),
      MainPage(),
      Interpretations(),
      Setting(),
    ];
  }

  int previousIndex = 0;
  AppColors colors = AppColors();
  List BottomNav_Icons = [
    "Home.svg",
    "Audio.svg",
    "Books.svg",
    "Setting.svg",
  ];
  @override
  Widget build(BuildContext context) {
    bool showFab = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 250),
        child: buildScreens[_currentIndex],
        transitionBuilder: (child, animation) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 16,
              color: Color.fromRGBO(31, 149, 106, 0.1))
        ]),
        height: !showFab ? 87 : 0,
        curve: Curves.fastEaseInToSlowEaseOut,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          curve: Curves.fastEaseInToSlowEaseOut,
          decoration: BoxDecoration(),
          child: BottomAppBar(
            notchMargin: 7,
            height: 65,
            shape: CircularNotchedRectangle(),
            color: Color.fromRGBO(255, 255, 255, 1),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconNavgation("Setting.svg", 4),
                  IconNavgation("Books.svg", 3),
                  IconNavgation("Home.svg", 2),
                  IconNavgation("Audio.svg", 1),
                  IconNavgation("Book.svg", 0),
                ],
              ),
            ),
          ),
        ),
      ),
      // floatingActionButton: Visibility(
      //   visible: !showFab,
      //   child: ClipOval(
      //     child: FloatingActionButton(
      //       foregroundColor: Colors.transparent,
      //       onPressed: () => setState(() => _currentIndex = 2),
      //       tooltip: 'Search',
      //       child: SvgPicture.asset(
      //         "assets/BottomNavagation/Book.svg",
      //         height: 30,
      //       ),
      //       elevation: 2.0,
      //       backgroundColor: Color(0xFF009688),
      //     ),
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }

  Widget IconNavgation(String Svg_Name, int index) {
    return GestureDetector(
      onTap: () => setState(() {
        previousIndex = _currentIndex;
        _currentIndex = index;
      }),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 250),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: _currentIndex == index ? colors.Primary : null,
        ),
        width: 36,
        height: 36,
        padding: EdgeInsets.all(5),
        child: SvgPicture.asset(
          "assets/BottomNavagation/$Svg_Name",
          // width: 20,
          // height: 20,
          colorFilter: ColorFilter.mode(
            _currentIndex == index
                ? Color.fromRGBO(255, 255, 255, 1)
                : Color.fromRGBO(153, 153, 153, 1),
            BlendMode.srcIn, // Use BlendMode.srcIn for direct color replacement
          ),
        ),
      ),
    );
  }
}
