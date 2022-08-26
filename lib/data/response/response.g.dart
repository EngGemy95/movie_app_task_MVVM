// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemsResponse _$ItemsResponseFromJson(Map<String, dynamic> json) =>
    ItemsResponse(
      json['adult'] as bool?,
      json['backdrop_path'] as String?,
      (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
      json['id'] as int?,
      json['original_language'] as String?,
      json['original_title'] as String?,
      json['overview'] as String?,
      (json['popularity'] as num?)?.toDouble(),
      json['poster_path'] as String?,
      json['release_date'] as String?,
      json['title'] as String?,
      json['video'] as bool?,
      (json['vote_average'] as num?)?.toDouble(),
      json['vote_count'] as int?,
    );

Map<String, dynamic> _$ItemsResponseToJson(ItemsResponse instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'genre_ids': instance.genreIds,
      'id': instance.id,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'title': instance.title,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };

MoviesResponse _$MoviesResponseFromJson(Map<String, dynamic> json) =>
    MoviesResponse(
      (json['results'] as List<dynamic>?)
          ?.map((e) => ItemsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['page'] as int?,
      json['total_pages'] as int?,
      json['total_results'] as int?,
    );

Map<String, dynamic> _$MoviesResponseToJson(MoviesResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
