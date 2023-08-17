import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class DataFromApi {
  static const ur = 'http://api.alquran.cloud/v1/meta';
  static final url = Uri.parse(ur);

  static Future<Map<String, dynamic>> fetchData() async {
    final res = await http.get(url);
    if (res.statusCode == 200) {
      final response = jsonDecode(res.body);
      if (kDebugMode) {
        
      }
      return response;
    } else {
      throw Exception('something went wrong');
    }
  }
}
