import 'package:json_annotation/json_annotation.dart';
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
}
