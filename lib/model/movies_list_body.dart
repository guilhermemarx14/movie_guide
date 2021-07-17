import 'package:json_annotation/json_annotation.dart';
import 'package:movie_guide/model/simplified_movie.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
part 'movies_list_body.g.dart';

@JsonSerializable()
class MoviesListBody {
  List<SimplifiedMovie>? movies;

  MoviesListBody({this.movies});

  factory MoviesListBody.fromJson(Map<String, dynamic> json) =>
      _$MoviesListBodyFromJson(json);
  Map<String, dynamic> toJson() => _$MoviesListBodyToJson(this);
}
