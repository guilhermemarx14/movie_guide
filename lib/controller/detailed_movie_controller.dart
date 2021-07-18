import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_guide/model/detailed_movie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailedMovieController {
  static Future<DetailedMovie> getMovieById(int id) async {
    //Verify if the value is already saved
    final prefs = await SharedPreferences.getInstance();
    var saved = prefs.getString('detailed_movie_${id}') ?? '';
    if (saved.isNotEmpty) {
      DetailedMovie? myMovie;
      var json = jsonDecode(saved);

      return DetailedMovie.fromJson(jsonDecode(saved));
    }

    final response = await http.get(Uri.parse(
        'https://desafio-mobile.nyc3.digitaloceanspaces.com/movies/' +
            id.toString()));
    if (response.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('detailed_movie_${id}', response.body);

      return DetailedMovie.fromJson(jsonDecode(response.body));
    } else {
      //keeps on trying till success
      return getMovieById(id);
    }
  }
}
