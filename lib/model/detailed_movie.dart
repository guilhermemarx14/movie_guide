import 'package:json_annotation/json_annotation.dart';
part 'detailed_movie.g.dart';

@JsonSerializable()
class DetailedMovie {
  bool? adult;
  String? backdrop_url;
  int? budget;
  List<String>? genres;
  String? homepage;
  int? id;
  String? imdb_id;
  String? original_language;
  String? original_title;
  String? overview;
  double? popularity;
  String? poster_url;
  String? release_date;
  int? revenue;
  int? runtime;
  String? tagline;
  double? vote_average;
  int? vote_count;
}
