import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  Future getApiData(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      }
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }
}
