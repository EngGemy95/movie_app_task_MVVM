import 'dart:io';

import 'package:dio/dio.dart';
import 'package:movies_app/data/response/response.dart';
import 'package:retrofit/http.dart';

import '../../app/constants.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String? baseUrl}) = _AppServiceClient;

  @GET("movie/{type}?api_key=f39b3eb131d7526fd993368134b11153&language=en-US")
  Future<MoviesResponse> getMovies(
    @Query("page") int page,
    @Path("type") String type,
  );
}
