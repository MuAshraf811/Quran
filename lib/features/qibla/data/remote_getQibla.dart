import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'geolocator.dart';
import 'package:http/http.dart' as http;

class RemoteGetQiblaDirection {
  static String url =
      'http://api.aladhan.com/v1/qibla/${GPS.myDevPos?.latitude}/${GPS.myDevPos?.longitude}';
  static final Uri uri = Uri.parse(url);

  static Future<double> getQiblaDirection() async {
    final res = await http.get(uri);
    if (res.statusCode == 200) {
      final Map<String, dynamic> response = jsonDecode(res.body);
      if (kDebugMode) {
        print('muhammed ashraf elsayed');
        print(response['data']['direction'].toString());
        print('muhammed ashraf elsayed');
      }
       return response['data']['direction'];
    } else {
      throw Exception('wrong in qibla api');
    }
  }
}
