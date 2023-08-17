import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class AyahsRemote {
  static String uri = 'http://api.alquran.cloud/v1/quran/quran-uthmani';
  static Uri url = Uri.parse(uri);

static Future<Map<String , dynamic>> fetchingAllAyahs() async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final res = jsonDecode(response.body);
      if (kDebugMode) {
        print(res.toString());
      }
      return res;
    } else {
      throw Exception('Some thing went wrong while fetching all ayahs');
    }
  }
}
