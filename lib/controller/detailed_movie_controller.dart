import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_guide/model/detailed_movie.dart';

class DetailedMovieController {
  static Future<DetailedMovie> getMovieById(int id) async {
    final response = await http.get(Uri.parse(
        'https://desafio-mobile.nyc3.digitaloceanspaces.com/movies/' +
            id.toString()));
    if (response.statusCode == 200) {
      return DetailedMovie.fromJson(jsonDecode(response.body));
    } else {
      //keeps trying till success
      return getMovieById(id);
    }
  }
}
