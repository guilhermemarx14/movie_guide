import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_guide/model/simplified_movie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SimplifiedMovieController {
  static Future<List<SimplifiedMovie>> getMovies() async {
    //Verify if the value is already saved
    final prefs = await SharedPreferences.getInstance();
    var saved = prefs.getString('simplified_movies_list') ?? '';
    if (saved.isNotEmpty) {
      List<SimplifiedMovie> myList = [];
      var json = jsonDecode(saved);

      for (var value in json) {
        myList.add(SimplifiedMovie.fromJson(value));
      }
      return myList;
    }

    final response = await http.get(
        Uri.parse('https://desafio-mobile.nyc3.digitaloceanspaces.com/movies'));

    if (response.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('simplified_movies_list', response.body);

      List<SimplifiedMovie> myList = [];
      var json = jsonDecode(response.body);

      for (var value in json) {
        myList.add(SimplifiedMovie.fromJson(value));
      }

      return myList;
    } else {
      //keeps on trying till success
      return getMovies();
    }
  }
}
