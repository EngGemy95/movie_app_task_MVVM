import 'package:flutter/material.dart';
import 'package:movies_app/presentation/movie_details/view/movie_details.dart';

import '../../app/di.dart';
import '../movies/view/movies_home.dart';
import '../resource_data/strings_manager.dart';

class Routes {
  static const String moviesHome = "/";
  static const String moviesDetails = "/movies_details";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.moviesHome:
        initMoviesModule();
        return MaterialPageRoute(
            maintainState: false,
            settings: settings,
            builder: (_) => const MoviesHomeView());
      case Routes.moviesDetails:
        return MaterialPageRoute(
            maintainState: false,
            settings: settings,
            builder: (_) => const MovieDetails());

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: const Center(
          child: Text(AppStrings.noRouteFound),
        ),
      );
    });
  }
}
