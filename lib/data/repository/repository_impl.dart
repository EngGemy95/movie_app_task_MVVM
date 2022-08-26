import 'package:dartz/dartz.dart';
import 'package:movies_app/app/app_prefs.dart';
import 'package:movies_app/data/mapper/mapper.dart';
import 'package:movies_app/domain/models/models.dart';
import 'package:movies_app/data/network/Failure.dart';
import 'package:movies_app/presentation/resource_data/strings_manager.dart';
import '../../domain/repository/repository.dart';
import '../data_source/remote_data_source.dart';
import '../network/error_handler.dart';
import '../network/network_info.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;
  final AppPreference _appPreference;

  RepositoryImpl(
      this._remoteDataSource, this._networkInfo, this._appPreference);

  @override
  Future<Either<Failure, MoviesModel>> getMovies(int page, String type) async {
    if (await _networkInfo.isConnected) {
      print("Loading from API");
      try {
        final response = await _remoteDataSource.getMovies(page, type);

        if (type == AppStrings.popularType) {
          _appPreference.setCachedMovies(
              AppStrings.popularType, response.results ?? []);
        } else if (type == AppStrings.topRatedType) {
          _appPreference.setCachedMovies(
              AppStrings.topRatedType, response.results ?? []);
        }

        return Right(response.toDomain());
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      print("Loading from cache");
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
