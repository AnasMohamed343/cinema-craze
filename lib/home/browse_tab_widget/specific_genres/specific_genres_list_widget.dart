import 'package:cinema_craze/data/apis/models/genres_movies_response/Genres.dart';
import 'package:cinema_craze/di/di.dart';
import 'package:cinema_craze/home/search_tab_widget/movie_search_item.dart';
import 'package:cinema_craze/utils/colors_manager.dart';
import 'package:cinema_craze/utils/constants.dart';
import 'package:cinema_craze/utils/reusable_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'specific_genres_list_vm.dart';

class SpecificGenreListWidget extends StatelessWidget {
  const SpecificGenreListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Genres genres = ModalRoute.of(context)?.settings.arguments as Genres;
    SpecificGenresListVM viewModel = getIt.get<SpecificGenresListVM>();
    viewModel.fetchSpecificGenres((genres.id).toString());
    return Scaffold(
      backgroundColor:  ColorsManager.bottomNavColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white54),
        backgroundColor:  ColorsManager.bottomNavColor,
        title: Text(
          genres.name ?? '',
          style: const TextStyle(
              color:  ColorsManager.whiteColor, fontSize: 17, fontWeight: FontWeight.w700),
        ),
      ),
      body: BlocBuilder<SpecificGenresListVM, SpecificGenresState>(
        bloc: viewModel,
        builder: (context, state) {
          switch (state) {
            case LoadingState():
              return Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(
                    color:  ColorsManager.primaryColor,
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
                      viewModel.fetchSpecificGenres((genres.id).toString());
                    },
                    child: const Text('Try Again'))
              ]));
            case SuccessState():
              return Expanded(
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      height: 1.2.h,
                      width: double.infinity.w,
                      color: Colors.grey.withOpacity(0.4),
                    );
                  },
                  itemBuilder: (context, index) {
                    var genre = state.specificGenresList?[index];
                    return MovieSearchItem(
                      specificGenre: state.specificGenresList?[index],
                      src:
                          '${Constants.imagePath}${genre?.posterPath ?? 'https://via.placeholder.com/150'} ',
                      title: '${genre?.title}',
                      voteAverage: genre!.voteAverage!.toStringAsFixed(1),
                      releaseDate: ReusableFunctions.extractYear(
                          genre.releaseDate ?? ""),
                    );
                  },
                  itemCount: state.specificGenresList!.length,
                ),
              );
          }
        },
      ),
    );
  }
}
