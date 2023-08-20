import 'dart:convert';

import 'package:http/http.dart' as http;

class FetchingAzkarSala {
  static String url =
      'https://ahegazy.github.io/muslimKit/json/PostPrayer_azkar.json';
 static final Uri uri = Uri.parse(url);

 static Future<Map<String, dynamic>>  fetchingData() async {
    final res = await http.get(uri);
    if (res.statusCode == 200) {
      final response = jsonDecode(res.body);
      return response;
    } else {
      throw Exception('wrong while fetching');
    }
  }
}
