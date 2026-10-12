import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix_app/model/trailer_model.dart';

class ApiService {
  Future<List<TrailerModel>> getTrailers() async {
    final url = Uri.parse('https://api.kinocheck.com/trailers/latest');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List trailers = data['trailers'];
      return trailers.map((json) => TrailerModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load trailers:${response.statusCode}');
    }
  }
}
