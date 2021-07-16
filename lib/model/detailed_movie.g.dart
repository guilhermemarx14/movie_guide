// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detailed_movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailedMovie _$DetailedMovieFromJson(Map<String, dynamic> json) {
  return DetailedMovie()
    ..adult = json['adult'] as bool?
    ..backdrop_url = json['backdrop_url'] as String?
    ..budget = json['budget'] as int?
    ..genres =
        (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList()
    ..homepage = json['homepage'] as String?
    ..id = json['id'] as int?
    ..imdb_id = json['imdb_id'] as String?
    ..original_language = json['original_language'] as String?
    ..original_title = json['original_title'] as String?
    ..overview = json['overview'] as String?
    ..popularity = (json['popularity'] as num?)?.toDouble()
    ..poster_url = json['poster_url'] as String?
    ..release_date = json['release_date'] as String?
    ..revenue = json['revenue'] as int?
    ..runtime = json['runtime'] as int?
    ..tagline = json['tagline'] as String?
    ..vote_average = (json['vote_average'] as num?)?.toDouble()
    ..vote_count = json['vote_count'] as int?;
}

Map<String, dynamic> _$DetailedMovieToJson(DetailedMovie instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_url': instance.backdrop_url,
      'budget': instance.budget,
      'genres': instance.genres,
      'homepage': instance.homepage,
      'id': instance.id,
      'imdb_id': instance.imdb_id,
      'original_language': instance.original_language,
      'original_title': instance.original_title,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_url': instance.poster_url,
      'release_date': instance.release_date,
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'tagline': instance.tagline,
      'vote_average': instance.vote_average,
      'vote_count': instance.vote_count,
    };
