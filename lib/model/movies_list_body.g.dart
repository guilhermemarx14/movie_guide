// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_list_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesListBody _$MoviesListBodyFromJson(Map<String, dynamic> json) {
  return MoviesListBody(
    movies: (json['movies'] as List<dynamic>?)
        ?.map((e) => SimplifiedMovie.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$MoviesListBodyToJson(MoviesListBody instance) =>
    <String, dynamic>{
      'movies': instance.movies,
    };
