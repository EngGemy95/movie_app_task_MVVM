import 'package:json_annotation/json_annotation.dart';
part 'response.g.dart';

// @JsonSerializable()
// class BaseResponse {
//   @JsonKey(name: "code")
//   int? code;
//   @JsonKey(name: "message")
//   String? message;
//   @JsonKey(name: "token")
//   String? token;
// }

@JsonSerializable()
class ItemsResponse {
  @JsonKey(name: "adult")
  bool? adult;
  @JsonKey(name: "backdrop_path")
  String? backdropPath;
  @JsonKey(name: "genre_ids")
  List<int>? genreIds;
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "original_language")
  String? originalLanguage;
  @JsonKey(name: "original_title")
  String? originalTitle;
  @JsonKey(name: "overview")
  String? overview;
  @JsonKey(name: "popularity")
  double? popularity;
  @JsonKey(name: "poster_path")
  String? posterPath;
  @JsonKey(name: "release_date")
  String? releaseDate;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "video")
  bool? video;
  @JsonKey(name: "vote_average")
  double? voteAverage;
  @JsonKey(name: "vote_count")
  int? voteCount;

  ItemsResponse(
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  );

  factory ItemsResponse.fromJson(Map<String, dynamic> json) =>
      _$ItemsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsResponseToJson(this);
}

@JsonSerializable()
class MoviesResponse {
  @JsonKey(name: "results")
  List<ItemsResponse>? results;
  @JsonKey(name: "page")
  int? page;
  @JsonKey(name: "total_pages")
  int? totalPages;
  @JsonKey(name: "total_results")
  int? totalResults;

  MoviesResponse(
    this.results,
    this.page,
    this.totalPages,
    this.totalResults,
  );

  factory MoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$MoviesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesResponseToJson(this);
}
