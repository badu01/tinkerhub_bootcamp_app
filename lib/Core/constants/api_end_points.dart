import 'package:tinker_bootcamp_app/Core/api_key.dart';
import 'package:tinker_bootcamp_app/Core/base_url.dart';

class ApiEndPoints {
  static String popular = '$baseUrl/movie/popular?api_key=$apiKey';
  static String search = '$baseUrl/search/movie?api_key=$apiKey';
  static getVID(movieID) {
    return '$baseUrl/movie/$movieID/videos?api_key=$apiKey';
  }
  static getDetailsURL(movieID) {
    return '$baseUrl/movie/$movieID?api_key=$apiKey';
  }
}
