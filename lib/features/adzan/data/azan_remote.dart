import 'dart:convert';
import 'package:http/http.dart' as http;

class AzanRemote {
  static String url =
      'http://api.aladhan.com/v1/calendarByCity/${DateTime.now().year}/${DateTime.now().month}?city=Cairo&country=Egypt&method=2';

  static final Uri uri = Uri.parse(url);

  static Future<Map<String, dynamic>> fetchingData() async {
    final res = await http.get(uri);
    if (res.statusCode == 200) {
      final response = jsonDecode(res.body);
      return response;
    } else {
      throw Exception('Some thing went wrong while data from aszn api');
    }
  }
}
