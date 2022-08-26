import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:movies_app/app/di.dart';
import 'package:movies_app/presentation/resource_data/route_manager.dart';

import '../../../app/constants.dart';
import '../../../app/functions.dart';
import '../../../data/network/network_info.dart';
import '../../../domain/models/models.dart';
import '../../resource_data/assets_manager.dart';
import '../../resource_data/color_manager.dart';
import '../../resource_data/strings_manager.dart';
import '../../resource_data/values_managers.dart';
import '../viewmodel/movies_home_viewmodel.dart';

class MoviesHomeView extends StatefulWidget {
  const MoviesHomeView({Key? key}) : super(key: key);

  @override
  State<MoviesHomeView> createState() => _MoviesHomeViewState();
}

class _MoviesHomeViewState extends State<MoviesHomeView> {
  final MoviesViewModel _viewModel = instance<MoviesViewModel>();
  final _controller = ScrollController();
  bool done = true;
  final _instance = instance<NetworkInfo>();

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _bind() {
    _controller.addListener(() async {
      if (_controller.position.maxScrollExtent == _controller.offset) {
        if (await _instance.isConnected) {
          _viewModel.getMovies(context, _viewModel.getType());
        }
      }
    });

    _viewModel.isMoviesFetchedSuccessfullyStreamController.stream
        .listen((isMoviesFetched) {
      if (isMoviesFetched) {
        SchedulerBinding.instance?.addPostFrameCallback((_) {
          //This is method inside (App Folder) as it will used in most of pages
          showScaffoldMessenger(context, AppStrings.moviesFetchedSuccessfully);
        });
      }
    });

    _viewModel.isRequestFailedStreamController.stream.listen((failure) async {
      // clear loading
      dismissDialog(context);

      //show popUp error
      showCustomDialogOfRequests(
          context,
          getErrorPopupDialog(
              context, popUpErrorChildren(context, failure.message)));
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (done) {
      _viewModel.getMovies(context, AppStrings.popularType);

      done = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text(AppStrings.movies), centerTitle: true),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: AppMargin.m10, vertical: AppMargin.m5),
              child: Row(
                children: [
                  Expanded(
                    child: StreamBuilder<Color>(
                        stream: _viewModel.outputPopularBtnBackgroundColor,
                        builder: (context, snapshot) {
                          return InkWell(
                            onTap: () {
                              _viewModel.setType(AppStrings.popularType);
                              _viewModel.getMovies(
                                  context, AppStrings.popularType,
                                  isRefresh: true);
                              _viewModel.setPopularBtnBackground(
                                  ColorManager.primary);
                              _viewModel
                                  .setTopRatedBtnBackground(ColorManager.grey);
                            },
                            child: Container(
                                margin: const EdgeInsets.all(AppMargin.m20),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(AppSize.s10),
                                  color: snapshot.data ?? ColorManager.primary,
                                ),
                                padding: const EdgeInsets.all(AppPadding.p10),
                                alignment: Alignment.bottomCenter,
                                child: const Text(
                                  AppStrings.popular,
                                  style: TextStyle(color: ColorManager.white),
                                )),
                          );
                        }),
                  ),
                  Expanded(
                    child: StreamBuilder<Color>(
                        stream: _viewModel.outputTopRatedBtnBackgroundColor,
                        builder: (context, snapshot) {
                          return InkWell(
                            onTap: () {
                              _viewModel.setType(AppStrings.topRatedType);
                              _viewModel.getMovies(
                                  context, AppStrings.topRatedType,
                                  isRefresh: true);

                              _viewModel.setTopRatedBtnBackground(
                                  ColorManager.primary);
                              _viewModel
                                  .setPopularBtnBackground(ColorManager.grey);
                            },
                            child: Container(
                                margin: const EdgeInsets.all(AppMargin.m20),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(AppSize.s10),
                                  color: snapshot.data ?? ColorManager.grey,
                                ),
                                padding: const EdgeInsets.all(AppPadding.p10),
                                alignment: Alignment.bottomCenter,
                                child: const Text(
                                  AppStrings.topRated,
                                  style: TextStyle(color: ColorManager.white),
                                )),
                          );
                        }),
                  ),
                ],
              ),
            ),
            Expanded(
              child: StreamBuilder<List<ItemsModel>>(
                  stream: _viewModel.outputMovies,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return RefreshIndicator(
                        onRefresh: (() => _viewModel.refresh(context)),
                        child: (snapshot.data?.length ?? 0) == 0
                            ? const Center(
                                child: Text(AppStrings.moviewNotExist),
                              )
                            : ListView.separated(
                                key: ObjectKey(snapshot.data?[0] ?? 0),
                                controller: _controller,
                                itemBuilder: (context, index) {
                                  return Stack(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context).pushNamed(
                                              Routes.moviesDetails,
                                              arguments: snapshot.data?[index]);
                                        },
                                        child: Card(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: AppSize.s200,
                                            child: Hero(
                                              tag: snapshot.data![index].id,
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    (Constants.posterPath +
                                                        (snapshot.data?[index]
                                                                .posterPath ??
                                                            Constants.empty)),
                                                fit: BoxFit.cover,
                                                placeholder: (context, url) {
                                                  return Lottie.asset(
                                                      JsonAssets.loading);
                                                },
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Center(
                                                  child: Lottie.asset(
                                                      JsonAssets.loading),
                                                ),
                                              ),
                                            ),
                                          ),
                                          elevation: AppSize.s8,
                                          shadowColor: Colors.green,
                                          margin: const EdgeInsets.all(
                                              AppMargin.m20),
                                          shape: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      AppSize.s10),
                                              borderSide: const BorderSide(
                                                  color: ColorManager.white)),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        left: 0,
                                        child: Container(
                                            margin: const EdgeInsets.all(
                                                AppMargin.m20),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      AppSize.s10),
                                              color:
                                                  Colors.black.withOpacity(0.4),
                                            ),
                                            padding: const EdgeInsets.all(
                                                AppPadding.p10),
                                            alignment: Alignment.bottomCenter,
                                            child: Text(
                                              snapshot.data?[index].title ??
                                                  Constants.dash,
                                              style: const TextStyle(
                                                  color: ColorManager.white),
                                            )),
                                      ),
                                    ],
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    const Divider(),
                                itemCount: snapshot.data?.length ?? 0,
                              ),
                      );
                    }
                  }),
            ),
          ],
        ));
  }
}
