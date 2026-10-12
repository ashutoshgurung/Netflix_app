import 'package:flutter/material.dart';
import 'package:netflix_app/model/trailer_model.dart';
import 'package:netflix_app/services/api_service.dart';

class MoviesProvider extends ChangeNotifier {
  final ApiService _service = ApiService();
  List<TrailerModel> trailers = [];
  bool isLoading = false;
  String? errorMEssage;
  Future<void> getTrailers() async {
    isLoading = true;
    notifyListeners();

    try {
      trailers = await _service.getTrailers();
      errorMEssage = null;
    } catch (e) {
      errorMEssage = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
