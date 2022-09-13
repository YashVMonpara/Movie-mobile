import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/service/api_urls.dart';

class APIHelper {
  Future<List?>? getMovieData() async {
    var response = await http.get(Uri.parse(getMovieDataUrl));
    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return jsonResponse;
    } else {}
    return null;
  }
}
