import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class GPS {
  static Position? myDevPos;
  static void checkServicesLocation() async {
    bool checker = await Geolocator.isLocationServiceEnabled();
    if (kDebugMode) {
      print(checker);
    }
    if (!checker) {
      askPermission();
    }
  }

  static void askPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      final Position pos = await getDevLovation();
      myDevPos = pos;
    }
    if (kDebugMode) {
      print(permission);
    }
  }

  static Future<Position> getDevLovation() async {
    final Position postion = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    return postion;
  }




  
}
