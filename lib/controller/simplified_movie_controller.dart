import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_guide/model/simplified_movie.dart';

class SimplifiedMovieController {
  static Future<List<SimplifiedMovie>> getMovies() async {
    final response = await http.get(
        Uri.parse('https://desafio-mobile.nyc3.digitaloceanspaces.com/movies'));
    if (response.statusCode == 200) {
      List<SimplifiedMovie> myList = [];
      var json = jsonDecode(response.body);

      for (var value in json) myList.add(SimplifiedMovie.fromJson(value));

      return myList;
    } else {
      //keeps trying till success
      return getMovies();
    }
  }
}
