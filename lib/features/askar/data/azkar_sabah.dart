import 'dart:convert';

import 'package:http/http.dart' as http;

class FetchingAzkarSabah {
  static String url =
      'https://ahegazy.github.io/muslimKit/json/azkar_sabah.json';
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
