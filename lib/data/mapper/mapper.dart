import '../../app/constants.dart';
import '../../app/extensions.dart';
import '../../domain/models/models.dart';
import '../response/response.dart';

// extension BaseResponseMapper on BaseResponse? {
//   BaseModel toDomain() {
//     return BaseModel(
//       this?.code.orZero() ?? Constants.zero,
//       this?.message.orEmpty() ?? Constants.empty,
//       this?.token.orEmpty() ?? Constants.empty,
//     );
//   }
// }

extension ItemsResponseMapper on ItemsResponse? {
  ItemsModel toDomain() {
    List<int> generalIds = (this?.genreIds?.map((e) => e.toInt()).cast<int>() ??
            const Iterable.empty())
        .toList();
    return ItemsModel(
      this?.adult.orFalse() ?? Constants.defaultBool,
      this?.backdropPath.orEmpty() ?? Constants.empty,
      generalIds,
      this?.id.orZero() ?? Constants.zero,
      this?.originalLanguage.orEmpty() ?? Constants.empty,
      this?.originalTitle.orEmpty() ?? Constants.empty,
      this?.overview.orEmpty() ?? Constants.empty,
      this?.popularity.orZero() ?? Constants.doubleZero,
      this?.posterPath.orEmpty() ?? Constants.empty,
      this?.releaseDate.orEmpty() ?? Constants.empty,
      this?.title.orEmpty() ?? Constants.empty,
      this?.video.orFalse() ?? Constants.defaultBool,
      this?.voteAverage.orZero() ?? Constants.doubleZero,
      this?.voteCount.orZero() ?? Constants.zero,
    );
  }
}

extension GetMoviesResponseMapper on MoviesResponse? {
  MoviesModel toDomain() {
    List<ItemsModel> items =
        (this?.results?.map((itemsResponse) => itemsResponse.toDomain()) ??
                const Iterable.empty())
            .toList();
    return MoviesModel(
      items,
      this?.page.orZero() ?? Constants.zero,
      this?.totalPages.orZero() ?? Constants.zero,
      this?.totalResults.orZero() ?? Constants.zero,
    );
  }
}
