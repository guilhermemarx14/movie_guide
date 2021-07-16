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
}
