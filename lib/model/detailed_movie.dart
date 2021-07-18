import 'package:json_annotation/json_annotation.dart';
part 'detailed_movie.g.dart';

@JsonSerializable()
class DetailedMovie {
  String? title;
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

  DetailedMovie(
      {this.adult,
      this.title,
      this.backdrop_url,
      this.budget,
      this.genres,
      this.homepage,
      this.id,
      this.imdb_id,
      this.original_language,
      this.original_title,
      this.overview,
      this.popularity,
      this.poster_url,
      this.release_date,
      this.revenue,
      this.runtime,
      this.tagline,
      this.vote_average,
      this.vote_count});

  factory DetailedMovie.fromJson(Map<String, dynamic> json) =>
      _$DetailedMovieFromJson(json);
  Map<String, dynamic> toJson() => _$DetailedMovieToJson(this);
}
