import 'package:flutter/material.dart';
import 'package:movies_app/app/constants.dart';
import 'package:movies_app/app/percentages.dart';
import 'package:movies_app/domain/models/models.dart';
import 'package:movies_app/presentation/resource_data/color_manager.dart';
import 'package:movies_app/presentation/resource_data/strings_manager.dart';
import 'package:movies_app/presentation/resource_data/values_managers.dart';

class MovieDetails extends StatefulWidget {
  const MovieDetails({Key? key}) : super(key: key);

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

Widget movieInfo(String title, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
    child: Row(children: [
      SelectableText(title,
          style: TextStyle(
            color: ColorManager.primary,
            fontWeight: FontWeight.bold,
            // fontSize: 18,
          )),
      Expanded(
        child: SelectableText(value,
            style: const TextStyle(
              color: ColorManager.black,
              //fontSize: 16,
            )),
      )
    ]),
  );
}

Widget _buildSliverAppBar(BuildContext context, ItemsModel movieDetails) {
  return SliverAppBar(
    expandedHeight:
        MediaQuery.of(context).size.height * Percentages.percentage_0_55,
    pinned: true,
    stretch: true,
    backgroundColor: ColorManager.grey,
    flexibleSpace: FlexibleSpaceBar(
      title: Text(
        movieDetails.title,
        style: const TextStyle(color: ColorManager.white),
        textAlign: TextAlign.start,
      ),
      background: Hero(
          tag: movieDetails.id,
          child: Image.network(
            (Constants.posterPath + movieDetails.posterPath),
            fit: BoxFit.cover,
          )),
    ),
  );
}

class _MovieDetailsState extends State<MovieDetails> {
  @override
  Widget build(BuildContext context) {
    final movieDetails =
        ModalRoute.of(context)!.settings.arguments as ItemsModel;

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _buildSliverAppBar(context, movieDetails),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
            margin: const EdgeInsets.all(AppMargin.m14),
            padding: const EdgeInsets.all(AppSize.s8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                movieInfo(AppStrings.overview, movieDetails.overview),
                movieInfo(AppStrings.originalTitle, movieDetails.originalTitle),
                movieInfo(
                    AppStrings.originalLanguage, movieDetails.originalLanguage),
                movieInfo(AppStrings.releaseDate, movieDetails.releaseDate),
                movieInfo(AppStrings.adult,
                    movieDetails.adult ? AppStrings.yes : AppStrings.no),
                movieInfo(
                    AppStrings.voteAverage, "${movieDetails.voteAverage}"),
              ],
            ),
          ),
          const SizedBox(
            height: 200,
          )
        ]))
      ],
    ));
  }
}
