import 'package:cinema_craze/data/apis/models/movie_similar_response/similar.dart';
import 'package:cinema_craze/data/apis/models/popular_response/popular.dart';
import 'package:cinema_craze/data/apis/models/recommended_response/Results.dart';
import 'package:cinema_craze/data/apis/models/specific_genres_response/specific_genre.dart';
import 'package:cinema_craze/data/apis/models/watchlist_model/watchlist_model.dart';
import 'package:cinema_craze/di/di.dart';
import 'package:cinema_craze/home/movie_details/genres_item_widget.dart';
import 'package:cinema_craze/home/movie_details/movie_details_vm.dart';
import 'package:cinema_craze/home/movie_details/similar_movies/similar_movies_list_view.dart';
import 'package:cinema_craze/home/widgets/custom_movie_list_widget.dart';
import 'package:cinema_craze/home/widgets/movie_item_widget.dart';
import 'package:cinema_craze/home/widgets/overview_dialog.dart';
import 'package:cinema_craze/home/widgets/play_button.dart';
import 'package:cinema_craze/utils/constants.dart';
import 'package:cinema_craze/utils/reusable_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int movieId;
  Popular? popular;
  Results? recommended;
  Similar? similar;
  SpecificGenre? specificGenre;
  WatchListModel? watchlistModel;

  MovieDetailsScreen({
    super.key,
    required this.movieId,
    this.popular,
    this.recommended,
    this.similar,
    this.specificGenre,
    this.watchlistModel,
  });

  @override
  Widget build(BuildContext context) {
    MovieDetailsVM viewModel = getIt.get<MovieDetailsVM>();
    viewModel.fetchMovieDetails(movieId);
    return Scaffold(
      backgroundColor: const Color(0xff1A1A1A),
      appBar: AppBar(
        backgroundColor: const Color(0xff1A1A1A),
        iconTheme: const IconThemeData(color: Colors.grey, size: 25),
        title: Text(
          popular != null
              ? '${popular!.title}'
              : (recommended != null
                  ? '${recommended!.title}'
                  : similar != null
                      ? '${similar?.title}'
                      : specificGenre != null
                          ? '${specificGenre?.title}'
                          : watchlistModel != null
                              ? '${watchlistModel?.title}'
                              : 'Unknown Title'),
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 22),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: BlocBuilder<MovieDetailsVM, MovieDetailsState>(
              bloc: viewModel,
              builder: (context, state) {
                if (state is LoadingState) {
                  return Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator(
                          color: Color(0xffFFB224),
                        ),
                        const SizedBox(width: 8),
                        Text(state.message),
                      ],
                    ),
                  );
                } else if (state is ErrorState) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(state.errorMessage ?? 'An error occurred'),
                        ElevatedButton(
                          onPressed: () {
                            viewModel.fetchMovieDetails(movieId);
                          },
                          child: const Text('Try Again'),
                        ),
                      ],
                    ),
                  );
                } else if (state is SuccessState) {
                  return Column(
                    children: [
                      Stack(
                        children: [
                          Image.network(
                            '${Constants.imagePath}${state.details?.backdropPath ?? 'https://via.placeholder.com/150'}',
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.error),
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 227.h,
                          ),
                          Positioned(
                            top: 78.h,
                            left: 165.h,
                            child: PlayButton(),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${state.details?.title}',
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Row(
                              children: [
                                Text(
                                  ReusableFunctions.extractYear(
                                      state.details?.releaseDate ?? ""),
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white24,
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  ReusableFunctions.getMovieClassification(
                                      state.details?.adult ?? false),
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white24,
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  ReusableFunctions.formatRuntime(
                                      state.details?.runtime),
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white24,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 13),
                              child: Row(
                                children: [
                                  MovieItemWidget(
                                    watchListModel: WatchListModel(
                                        id: state.details?.id.toString() ?? '',
                                        title:
                                            state.details?.title ?? 'No Title',
                                        image:
                                            '${Constants.imagePath}${state.details?.posterPath ?? 'https://via.placeholder.com/150'} ',
                                        description:
                                            '${state.details?.overview}',
                                        releaseDate: state.details?.releaseDate
                                                .toString() ??
                                            '',
                                        movieId: state.details?.id ?? 0),
                                    src:
                                        '${Constants.imagePath}${state.details?.posterPath ?? 'https://via.placeholder.com/150'}',
                                    height: 220.h,
                                    width: 150.w,
                                  ),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Wrap(
                                            spacing: 10,
                                            runSpacing: 8,
                                            children:
                                                state.details?.genres?.map((e) {
                                                      return GenresItemWidget(
                                                        data: '${e.name}',
                                                      );
                                                    }).toList() ??
                                                    [],
                                          ),
                                          SizedBox(height: 15.h),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, bottom: 5, right: 8),
                                            child: InkWell(
                                              onTap: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      OverViewDialog(
                                                    data:
                                                        '${state.details?.overview}',
                                                  ),
                                                );
                                              },
                                              child: Text(
                                                maxLines: 4,
                                                '${state.details?.overview}',
                                                style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 13,
                                                  overflow:
                                                      TextOverflow.visible,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, top: 5),
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.star,
                                                  color: Colors.yellow,
                                                  size: 30,
                                                ),
                                                SizedBox(width: 10.w),
                                                Text(
                                                  state.details!.voteAverage!
                                                      .toStringAsFixed(1),
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomMovieListWidget(
                        height: 246.h,
                        data: 'More Like This',
                        childWidget: SimilarMoviesListView(movieId: movieId),
                      ),
                    ],
                  );
                }
                return Container(); // Fallback for any other state
              },
            ),
          ),
        ],
      ),
    );
  }
}
