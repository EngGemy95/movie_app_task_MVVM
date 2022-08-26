import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/models/models.dart';
import 'package:movies_app/domain/usecase/base_usecase.dart';

import '../../data/network/Failure.dart';
import '../repository/repository.dart';

class GetMoviesUseCase extends BaseUseCase<GetMoviesInput, MoviesModel> {
  final Repository _repository;

  GetMoviesUseCase(this._repository);

  @override
  Future<Either<Failure, MoviesModel>> execute(GetMoviesInput input) async {
    return await _repository.getMovies(input.page, input.type);
  }
}

class GetMoviesInput {
  int page;
  String type;

  GetMoviesInput(this.page, this.type);
}
