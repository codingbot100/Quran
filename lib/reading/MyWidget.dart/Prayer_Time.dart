import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:quran/Tools/Colors.dart';

class PrayerTime extends StatelessWidget {
  PrayerTime({super.key});
  final AppColors Mycolors = AppColors();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Container(
        width: double.infinity,
        height: 240,
        decoration: BoxDecoration(
          color: Mycolors.Primary,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Text(
                "اوقات شرعی نماز ها",
                style: TextStyle(
                  fontSize: 21,
                  fontFamily: "YekanBakh",
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 7),
              child: Text(
                "به افق شهر هرات",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "YekanBakh",
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CityDisplay extends StatefulWidget {
  @override
  _CityDisplayState createState() => _CityDisplayState();
}

class _CityDisplayState extends State<CityDisplay> {
  String _cityName = "Loading...";

  @override
  void initState() {
    super.initState();
    _getCityName();
  }

  Future<void> _getCityName() async {
    // Request permission to access location
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _cityName = "Location services are disabled.";
      });
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          _cityName = "Location permissions are denied.";
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _cityName = "Location permissions are permanently denied.";
      });
      return;
    }

    // Get current location
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // Get the city name from coordinates
    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    if (placemarks.isNotEmpty) {
      setState(() {
        _cityName = placemarks.first.locality ?? "Unknown location";
      });
    } else {
      setState(() {
        _cityName = "City not found";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'به افق شهر $_cityName',
      style: TextStyle(
        fontSize: 14,
        fontFamily: "YekanBakh",
        fontWeight: FontWeight.w600,
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
    );
  }
}
