import 'package:cinema_craze/data/apis/models/popular_response/popular.dart';
import 'package:cinema_craze/di/di.dart';
import 'package:cinema_craze/home/home_tab/popular_fragmant/popular_list_view_model.dart';
import 'package:cinema_craze/home/home_tab/release_fragmant/release_movie_item.dart';
import 'package:cinema_craze/home/search_tab_widget/movie_search_item.dart';
import 'package:cinema_craze/home/widgets/movie_item_widget.dart';
import 'package:cinema_craze/utils/constants.dart';
import 'package:cinema_craze/utils/reusable_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTabWidget extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xff282A28),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.white),
      ),
      textTheme: TextTheme(
        headline6: TextStyle(color: Colors.white),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.only(right: 22),
        child: IconButton(
          onPressed: () {
            showResults(context);
          },
          icon: Icon(Icons.search),
          color: Colors.grey,
          iconSize: 32,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back),
        color: Colors.white30,
        iconSize: 25,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    PopularListVM viewModel = getIt.get<PopularListVM>();
    viewModel.loadSearchMovie(query);
    return Container(
      color: Color(0xff282A28),
      child: BlocBuilder<PopularListVM, PopularListState>(
        bloc: viewModel,
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: Color(0xffFFB224),
                  ),
                  SizedBox(width: 8),
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
                      viewModel.fetchPopular();
                    },
                    child: Text('Try Again'),
                  ),
                ],
              ),
            );
          } else if (state is SuccessState) {
            if (state.popularList == null || state.popularList!.isEmpty) {
              return Center(
                child: Text(
                  'No popular movies found.',
                  style: TextStyle(color: Colors.white),
                ),
              );
            }
            return Expanded(
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    height: 2.h,
                    width: double.infinity.w,
                    color: Colors.grey.withOpacity(0.4),
                  );
                },
                itemBuilder: (context, index) {
                  var movie = state.popularList?[index];
                  return MovieSearchItem(
                    popular: movie,
                    src:
                        '${Constants.imagePath}${movie?.posterPath ?? 'https://via.placeholder.com/150'} ',
                    title: '${movie?.title}',
                    voteAverage: movie!.voteAverage!.toStringAsFixed(1),
                    releaseDate:
                        ReusableFunctions.extractYear(movie.releaseDate ?? ""),
                  );
                },
                itemCount: state.popularList!.length,
              ),
            );
          }
          return Container(); // Fallback for any other state
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    PopularListVM viewModel = getIt.get<PopularListVM>();
    viewModel.loadSearchMovie(query);
    return Container(
      color: Color(0xff282A28),
      child: BlocBuilder<PopularListVM, PopularListState>(
        bloc: viewModel,
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: Color(0xffFFB224),
                  ),
                  SizedBox(width: 8),
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
                      viewModel.fetchPopular();
                    },
                    child: Text('Try Again'),
                  ),
                ],
              ),
            );
          } else if (state is SuccessState) {
            if (state.popularList == null || state.popularList!.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 120.h,
                      width: 110.w,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  'assets/images/Icon-no-movies.png'))),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'No movies found',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              );
            }
            return Expanded(
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    height: 1.2.h,
                    width: double.infinity.w,
                    color: Colors.grey.withOpacity(0.4),
                  );
                },
                itemBuilder: (context, index) {
                  var movie = state.popularList?[index];
                  return MovieSearchItem(
                    popular: movie,
                    src:
                        '${Constants.imagePath}${movie?.posterPath ?? 'https://via.placeholder.com/150'} ',
                    title: '${movie?.title}',
                    voteAverage: movie!.voteAverage!.toStringAsFixed(1),
                    releaseDate:
                        ReusableFunctions.extractYear(movie.releaseDate ?? ""),
                  );
                },
                itemCount: state.popularList!.length,
              ),
            );
          }
          return Container(); // Fallback for any other state
        },
      ),
    );
  }
}
