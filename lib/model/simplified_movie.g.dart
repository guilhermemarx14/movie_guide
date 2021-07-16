// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simplified_movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SimplifiedMovie _$SimplifiedMovieFromJson(Map<String, dynamic> json) {
  return SimplifiedMovie()
    ..id = json['id'] as int?
    ..vote_average = (json['vote_average'] as num?)?.toDouble()
    ..title = json['title'] as String?
    ..poster_url = json['poster_url'] as String?
    ..genres =
        (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList()
    ..release_date = json['release_date'] as String?;
}

Map<String, dynamic> _$SimplifiedMovieToJson(SimplifiedMovie instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vote_average': instance.vote_average,
      'title': instance.title,
      'poster_url': instance.poster_url,
      'genres': instance.genres,
      'release_date': instance.release_date,
    };
