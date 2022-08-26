import 'package:dartz/dartz.dart';
import 'package:movies_app/domain/models/models.dart';

import '../../data/network/Failure.dart';

abstract class Repository {
  Future<Either<Failure, MoviesModel>> getMovies(int page, String type);
}
