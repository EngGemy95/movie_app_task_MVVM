import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/app/app_prefs.dart';
import 'package:movies_app/domain/models/models.dart';
import 'package:movies_app/domain/usecase/get_movies_usecase.dart';
import 'package:movies_app/presentation/base/base_viewmodel.dart';
import 'package:movies_app/presentation/common/freezed_data_classes.dart';
import 'package:movies_app/presentation/resource_data/strings_manager.dart';

import '../../../data/network/Failure.dart';

class MoviesViewModel extends BaseViewModel
    with MoviesViewModelInput, MoviesViewModelOutput {
  final StreamController<List<ItemsModel>> _moviesStreamController =
      StreamController.broadcast();

  final StreamController<bool> isMoviesFetchedSuccessfullyStreamController =
      StreamController<bool>.broadcast();

  final StreamController isRequestFailedStreamController =
      StreamController<Failure>.broadcast();

  final StreamController _popularBtnBackgroundStreamController =
      StreamController<Color>.broadcast();

  final StreamController _topRatedBtnBackgroundStreamController =
      StreamController<Color>.broadcast();

  List<ItemsModel> items = [];
  List<ItemsModel> cahchedPopularItems = [];
  List<ItemsModel> cahchedTopRatedItems = [];
  List<ItemsModel> emptyItems = [];
  List<ItemsModel>? prefrencePopularMovies;
  List<ItemsModel>? prefrenceTopRatedMovies;

  final GetMoviesUseCase _getMoviesUseCase;
  final AppPreference _appPreference;

  MoviesViewModel(this._getMoviesUseCase, this._appPreference);

  GetMoviesObject _getMoviesObject =
      GetMoviesObject(1, AppStrings.popularType, true);

  @override
  void start() {}

  @override
  void dispose() {
    _moviesStreamController.close();
    isRequestFailedStreamController.close();
    isMoviesFetchedSuccessfullyStreamController.close();
  }

  @override
  getMovies(BuildContext context, String type, {bool isRefresh = false}) async {
    if (isRefresh) {
      _getMoviesObject = _getMoviesObject.copyWith(page: 1);
      _getMoviesObject = _getMoviesObject.copyWith(isHasMoreMovies: true);
      _getMoviesObject = _getMoviesObject.copyWith(type: type);
      items.clear();
    }

    (await _getMoviesUseCase
            .execute(GetMoviesInput(currentPage(), _getMoviesObject.type)))
        .fold((failure) {
      if (failure.code == -6) {
        // Internet connection error

        if (type == AppStrings.popularType) {
          prefrencePopularMovies = _appPreference.getCachedMovies(type);
          cahchedPopularItems.addAll(prefrencePopularMovies ?? []);
          inputMovies.add(cahchedPopularItems);
        }
        if (type == AppStrings.topRatedType) {
          prefrenceTopRatedMovies = _appPreference.getCachedMovies(type);
          cahchedTopRatedItems.addAll(prefrenceTopRatedMovies ?? []);
          inputMovies.add(cahchedTopRatedItems);
        }
      } else {
        inputIsRequestFailed.add(failure);
        emptyItems.clear();
        inputMovies.add(emptyItems);
      }
    }, (data) {
      if (type == AppStrings.popularType) {
        cahchedPopularItems = data.results;
      } else if (type == AppStrings.topRatedType) {
        cahchedTopRatedItems = data.results;
      }

      incrementPage(currentPage() + 1);

      if (items.length < data.totalResults) {
        _getMoviesObject = _getMoviesObject.copyWith(isHasMoreMovies: false);
      }

      if (isRefresh) {
        items = data.results;
      } else {
        items.addAll(data.results.map((item) => item).toList());
      }

      inputMovies.add(items);

      isMoviesFetchedSuccessfullyStreamController.add(true);
    });
  }

  @override
  Sink get inputMovies => _moviesStreamController.sink;

  @override
  Sink get inputIsRequestFailed => isRequestFailedStreamController.sink;

  @override
  Stream<Failure> get outputIsRequestFailed =>
      isRequestFailedStreamController.stream
          .map((failureObject) => failureObject);

  @override
  Stream<List<ItemsModel>> get outputMovies =>
      _moviesStreamController.stream.map((movies) => movies);

  @override
  Sink get inputPopularBtnBackgroundColor =>
      _popularBtnBackgroundStreamController.sink;

  @override
  Stream<Color> get outputPopularBtnBackgroundColor =>
      _popularBtnBackgroundStreamController.stream.map((color) => color);

  @override
  Sink get inputTopRatedBtnBackgroundColor =>
      _topRatedBtnBackgroundStreamController.sink;

  @override
  Stream<Color> get outputTopRatedBtnBackgroundColor =>
      _topRatedBtnBackgroundStreamController.stream.map((color) => color);

  @override
  setMoviesType(String type) {
    _getMoviesObject = _getMoviesObject.copyWith(type: type);
  }

  @override
  setPage(int page) {
    _getMoviesObject = _getMoviesObject.copyWith(page: page);
  }

  @override
  bool isHasMoreMovies() {
    return _getMoviesObject.isHasMoreMovies;
  }

  @override
  incrementPage(int newPage) {
    _getMoviesObject = _getMoviesObject.copyWith(page: newPage);
  }

  @override
  int currentPage() {
    return _getMoviesObject.page;
  }

  @override
  setType(String type) {
    return _getMoviesObject = _getMoviesObject.copyWith(type: type);
  }

  @override
  String getType() {
    return _getMoviesObject.type;
  }

  @override
  setPopularBtnBackground(Color color) {
    inputPopularBtnBackgroundColor.add(color);
  }

  @override
  setTopRatedBtnBackground(Color color) {
    inputTopRatedBtnBackgroundColor.add(color);
  }

  @override
  Future refresh(BuildContext context) async {
    await getMovies(context, getType(), isRefresh: true);
  }
}

abstract class MoviesViewModelInput {
  getMovies(BuildContext context, String type, {bool isRefresh = false});
  setMoviesType(String type);
  setPage(int page);
  bool isHasMoreMovies();
  incrementPage(int newPage);
  int currentPage();
  setType(String type);
  String getType();
  Future refresh(BuildContext context);
  setPopularBtnBackground(Color color);
  setTopRatedBtnBackground(Color color);
  Sink get inputMovies;
  Sink get inputIsRequestFailed;
  Sink get inputPopularBtnBackgroundColor;
  Sink get inputTopRatedBtnBackgroundColor;
}

abstract class MoviesViewModelOutput {
  Stream<List<ItemsModel>> get outputMovies;
  Stream<Failure> get outputIsRequestFailed;
  Stream<Color> get outputPopularBtnBackgroundColor;
  Stream<Color> get outputTopRatedBtnBackgroundColor;
}
