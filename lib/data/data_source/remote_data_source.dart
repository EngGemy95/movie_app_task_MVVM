import 'package:movies_app/data/response/response.dart';

import '../network/app_api.dart';

abstract class RemoteDataSource {
  Future<MoviesResponse> getMovies(int page, String type);
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<MoviesResponse> getMovies(int page, String type) async {
    return await _appServiceClient.getMovies(page, type);
  }
}
