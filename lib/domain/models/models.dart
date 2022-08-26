class BaseModel {
  int code;
  String message;
  String token;

  BaseModel(this.code, this.message, this.token);
}

class ItemsModel {
  bool adult;
  String backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  ItemsModel(
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
}

class MoviesModel {
  List<ItemsModel> results;
  int page;
  int totalPages;
  int totalResults;

  MoviesModel(
    this.results,
    this.page,
    this.totalPages,
    this.totalResults,
  );
}
