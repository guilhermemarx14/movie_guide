import 'package:json_annotation/json_annotation.dart';
import 'movies_list_body.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
part 'simplified_movie.g.dart';

@JsonSerializable()
class SimplifiedMovie {
  int? id;
  double? vote_average;
  String? title;
  String? poster_url;
  List<String>? genres;
  String? release_date;

  SimplifiedMovie(
      {this.id,
      this.vote_average,
      this.title,
      this.poster_url,
      this.genres,
      this.release_date});

  factory SimplifiedMovie.fromJson(Map<String, dynamic> json) =>
      _$SimplifiedMovieFromJson(json);
  Map<String, dynamic> toJson() => _$SimplifiedMovieToJson(this);

  static Future<List<SimplifiedMovie>> getMovies() async {
    final response = await http.get(
        Uri.parse('https://desafio-mobile.nyc3.digitaloceanspaces.com/movies'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List<SimplifiedMovie> myList = [];
      var json = jsonDecode(response.body);

      for (var value in json) myList.add(SimplifiedMovie.fromJson(value));

      return myList;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load movies');
    }
  }
}
