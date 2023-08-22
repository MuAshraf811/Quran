import 'package:geolocator/geolocator.dart';

class GPS {
  static void checkServicesLocation() async {
    bool checker = await Geolocator.isLocationServiceEnabled();
    if (!checker) {
      askPermission();
    }
  }

  static void askPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
  }
}
