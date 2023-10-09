import 'package:http/http.dart' as http;
import 'dart:convert';

class Service {
  static String baseUrl = '';
  static get<T>(String url) async {
    Uri uri = Uri.parse(baseUrl + url);
    http.Response response = await http.get(uri);
    try {
      return jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    } catch (e) {
      return response.body;
    }
  }

  static post<T>(String url, Map<dynamic, dynamic> body) async {
    Uri uri = Uri.parse(baseUrl + url);
    http.Response response = await http.post(uri, body: body);
    try {
      return jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    } catch (e) {
      return response.body;
    }
  }
}
