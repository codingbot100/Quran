import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:shamsi_date/shamsi_date.dart';

// class DateDisplay extends StatelessWidget {
//   const DateDisplay({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final now = DateTime.now();

//     // Convert to Solar Hijri (Jalali)
//     final jalaliDate = Jalali.fromDateTime(now);

//     // Convert to Islamic Hijri
//     final hijriDate = HijriCalendar.fromDate(now);

//     // Day of the week in Persian
//     final weekDays = [
//       'شنبه',
//       'یک‌شنبه',
//       'دوشنبه',
//       'سه‌شنبه',
//       'چهارشنبه',
//       'پنج‌شنبه',
//       'جمعه'
//     ];

//     // Get the Persian day of the week
//     final jalaliDayOfWeek =
//         weekDays[jalaliDate.weekDay - 1]; // Jalali weekDay is 1-based

//     // Format the final string
//     final String formattedDate =
//         '$jalaliDayOfWeek ${jalaliDate.day} ${jalaliDate.formatter.mN} | ${hijriDate.hDay} ${hijriDate.longMonthName} ${hijriDate.hYear}';

//     return Center(
//       child: Directionality(
//         textDirection: TextDirection.rtl,
//         child: Text(
//           formattedDate,
//           style: TextStyle(
//             fontSize: 16,
//             fontFamily: "YekanBakh",
//             fontWeight: FontWeight.w400,
//             color: Color.fromRGBO(255, 255, 255, 0.8),
//           ),
//         ),
//       ),
//     );
//   }
// }

class DateDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get current Gregorian date
    final DateTime now = DateTime.now();

    // Convert to Solar Hijri (Afghan/Persian) date
    final Jalali jalaliDate = Jalali.fromDateTime(now);

    // Convert to Hijri (Islamic) date
    final HijriCalendar hijriDate = HijriCalendar.fromDate(now);

    // Format the dates
    final String dayOfWeek = getJalaliWeekdayName(jalaliDate.weekDay);
    final String solarHijriDate =
        '${jalaliDate.day} ${getJalaliMonthName(jalaliDate.month)}';
    final String formattedHijriDate =
        '${hijriDate.hDay} ${getHijriMonthName(hijriDate.hMonth)} ${hijriDate.hYear}';

    return Text(
      '$dayOfWeek $solarHijriDate  |  $formattedHijriDate',
      style: TextStyle(
        fontSize: 16,
        fontFamily: "YekanBakh",
        fontWeight: FontWeight.w400,
        color: Color.fromRGBO(255, 255, 255, 0.8),
      ),
    );
  }

  String getJalaliWeekdayName(int weekDay) {
    const weekDays = [
      'شنبه',
      'یک‌شنبه',
      'دوشنبه',
      'سه‌شنبه',
      'چهارشنبه',
      'پنج‌شنبه',
      'جمعه'
    ];
    return weekDays[weekDay - 1];
  }

  String getJalaliMonthName(int month) {
    const months = [
      'حمل',
      'ثور',
      'جوزا',
      'سرطان',
      'اسد',
      'سنبله',
      'میزان',
      'عقرب',
      'قوس',
      'جدی',
      'دلو',
      'حوت'
    ];
    return months[month - 1];
  }

  String getHijriMonthName(int month) {
    const hijriMonths = [
      'محرم',
      'صفر',
      'ربیع‌الاول',
      'ربیع‌الثانی',
      'جمادی‌الاولی',
      'جمادی‌الثانی',
      'رجب',
      'شعبان',
      'رمضان',
      'شوال',
      'ذی‌القعده',
      'ذی‌الحجه'
    ];
    return hijriMonths[month - 1];
  }
}
