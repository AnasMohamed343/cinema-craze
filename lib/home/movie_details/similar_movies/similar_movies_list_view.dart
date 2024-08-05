import 'package:cinema_craze/di/di.dart';
import 'package:cinema_craze/home/movie_details/similar_movies/similar_movie_item.dart';
import 'package:cinema_craze/home/movie_details/similar_movies/similar_movies_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SimilarMoviesListView extends StatelessWidget {
  final int movieId;
  SimilarMoviesListView({super.key, required this.movieId});
  @override
  Widget build(BuildContext context) {
    SimilarMoviesVM viewModel = getIt.get<SimilarMoviesVM>();
    viewModel.fetchSimilarMovies(movieId);
    return BlocBuilder<SimilarMoviesVM, SimilarMoviesState>(
      bloc: viewModel,
      builder: (context, state) {
        switch (state) {
          case LoadingState():
            return Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: Color(0xffFFBB3B),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(state.message),
              ],
            ));
          case ErrorState():
            return Center(
                child: Column(children: [
              Text(state.errorMessage ?? ''),
              ElevatedButton(
                  onPressed: () {
                    viewModel.fetchSimilarMovies(movieId);
                  },
                  child: Text('Try Again'))
            ]));
          case SuccessState():
            return Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  width: 15.w,
                ),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        //border: Border.all(color: Colors.black26),
                        borderRadius: BorderRadius.circular(10)),
                    height: 228.h,
                    width: 120.w,
                    child: Card(
                      color: Color(0xff282A28),
                      child: SimilarMovieItem(
                        similar: state.similarMoviesLis?[index],
                      ),
                    ),
                  );
                },
                itemCount: state.similarMoviesLis!.length,
              ),
            );
        }
      },
    );
  }
}
