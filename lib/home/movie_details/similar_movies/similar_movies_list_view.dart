import 'package:cinema_craze/di/di.dart';
import 'package:cinema_craze/home/movie_details/similar_movies/similar_movie_item.dart';
import 'package:cinema_craze/home/movie_details/similar_movies/similar_movies_vm.dart';
import 'package:cinema_craze/utils/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SimilarMoviesListView extends StatefulWidget {
  final int movieId;
  SimilarMoviesListView({super.key, required this.movieId});

  @override
  State<SimilarMoviesListView> createState() => _SimilarMoviesListViewState();
}

class _SimilarMoviesListViewState extends State<SimilarMoviesListView> {
  @override
  Widget build(BuildContext context) {
    SimilarMoviesVM viewModel = getIt.get<SimilarMoviesVM>();
    viewModel.fetchSimilarMovies(widget.movieId);
    return BlocBuilder<SimilarMoviesVM, SimilarMoviesState>(
      bloc: viewModel,
      builder: (context, state) {
        switch (state) {
          case LoadingState():
            return Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(
                  color: Color(0xffFFBB3B),
                ),
                const SizedBox(
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
                    viewModel.fetchSimilarMovies(widget.movieId);
                  },
                  child: const Text('Try Again'))
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
                      color: ColorsManager.moviesContainerBgColor,
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
//
// import 'package:cinema_craze/data/apis/models/watchlist_model/watchlist_model.dart';
// import 'package:cinema_craze/di/di.dart';
// import 'package:cinema_craze/home/movie_details/similar_movies/similar_movies_vm.dart';
// import 'package:cinema_craze/home/widgets/custom_show_dialog.dart';
// import 'package:cinema_craze/utils/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import 'package:cinema_craze/helper/provider/watchlist_provider.dart';
// import 'package:cinema_craze/home/movie_details/similar_movies/similar_movie_item.dart';
//
// class SimilarMoviesListView extends StatefulWidget {
//   final int movieId;
//
//   SimilarMoviesListView({super.key, required this.movieId});
//
//   @override
//   State<SimilarMoviesListView> createState() => _SimilarMoviesListViewState();
// }
//
// class _SimilarMoviesListViewState extends State<SimilarMoviesListView> {
//   @override
//   void initState() {
//     super.initState();
//     final viewModel = context.read<SimilarMoviesVM>();
//     viewModel.fetchSimilarMovies(widget.movieId);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final watchlistProvider = Provider.of<WatchlistProvider>(context);
//
//     return BlocBuilder<SimilarMoviesVM, SimilarMoviesState>(
//       builder: (context, state) {
//         if (state is LoadingState) {
//           return Center(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CircularProgressIndicator(
//                   color: Color(0xffFFBB3B),
//                 ),
//                 SizedBox(width: 8),
//                 Text(state.message),
//               ],
//             ),
//           );
//         } else if (state is ErrorState) {
//           return Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(state.errorMessage ?? 'An error occurred'),
//                 ElevatedButton(
//                   onPressed: () {
//                     context
//                         .read<SimilarMoviesVM>()
//                         .fetchSimilarMovies(widget.movieId);
//                   },
//                   child: Text('Try Again'),
//                 ),
//               ],
//             ),
//           );
//         } else if (state is SuccessState) {
//           if (state.similarMoviesLis == null ||
//               state.similarMoviesLis!.isEmpty) {
//             return Center(
//               child: Text(
//                 'No similar movies found.',
//                 style: TextStyle(color: Colors.white),
//               ),
//             );
//           }
//
//           return Expanded(
//             child: ListView.separated(
//               separatorBuilder: (context, index) => SizedBox(width: 15.w),
//               scrollDirection: Axis.horizontal,
//               itemBuilder: (context, index) {
//                 final movie = state.similarMoviesLis?[index];
//                 if (movie == null) return Container();
//
//                 final movieId = movie.id ?? 0;
//                 final watchlistModel = WatchListModel(
//                   id: movieId.toString(),
//                   title: movie.title ?? '',
//                   image:
//                       '${Constants.imagePath}${movie.posterPath ?? 'https://via.placeholder.com/150'}',
//                   description: movie.overview ?? '',
//                   releaseDate: movie.releaseDate ?? '',
//                   isWatchList: true,
//                   movieId: movieId,
//                 );
//
//                 return FutureBuilder<bool>(
//                   future:
//                       watchlistProvider.checkIfFilmExists(movieId.toString()),
//                   builder: (context, snapshot) {
//                     if (!snapshot.hasData) {
//                       return CircularProgressIndicator();
//                     }
//
//                     final isInWatchList = snapshot.data!;
//
//                     return Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       height: 228.h,
//                       width: 120.w,
//                       child: Card(
//                         color: Color(0xff282A28),
//                         child: SimilarMovieItem(
//                           isWatchList: isInWatchList,
//                           onTap: () async {
//                             if (isInWatchList) {
//                               await watchlistProvider
//                                   .deleteWatchlist(movieId.toString());
//                             } else {
//                               await watchlistProvider
//                                   .addWatchlist(watchlistModel);
//                             }
//                             setState(() {}); // Trigger UI update
//                           },
//                           similar: movie,
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//               itemCount: state.similarMoviesLis!.length,
//             ),
//           );
//         }
//
//         return Container(); // Fallback for any other state
//       },
//     );
//   }
// }
