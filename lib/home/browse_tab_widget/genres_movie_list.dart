import 'package:cinema_craze/di/di.dart';
import 'package:cinema_craze/home/browse_tab_widget/browse_tab_vm.dart';
import 'package:cinema_craze/home/browse_tab_widget/genres_item_widget.dart';
import 'package:cinema_craze/utils/assets_manager.dart';
import 'package:cinema_craze/utils/colors_manager.dart';
import 'package:cinema_craze/utils/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenresMovieList extends StatelessWidget {
  List<String> imagePaths = [
    AssetsManager.actionGenre,
    AssetsManager.adventureGenre,
    AssetsManager.animationGenre,
    AssetsManager.comedyGenre,
    AssetsManager.crimeGenre,
    AssetsManager.docGenre,
    AssetsManager.dramaGenre,
    AssetsManager.familyGenre,
    AssetsManager.fantasyGenre,
    AssetsManager.historyGenre,
    AssetsManager.horrorGenre,
    AssetsManager.musicGenre,
    AssetsManager.mysteryGenre,
    AssetsManager.romanceGenre,
    AssetsManager.sfGenre,
    AssetsManager.tvGenre,
    AssetsManager.thrillerGenre,
    AssetsManager.warGenre,
    AssetsManager.westernGenre
  ];
  @override
  Widget build(BuildContext context) {
    BrowseTabVM viewModel = getIt.get<BrowseTabVM>();
    viewModel.fetchGenresList();
    return BlocBuilder<BrowseTabVM, BrowseTabState>(
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
                    viewModel.fetchGenresList();
                  },
                  child: const Text('Try Again'))
            ]));
          case SuccessState():
            return Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.w,
                  crossAxisSpacing: 16.h,
                ),
                itemCount: state.genresList?.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RoutesManager.specificGenreListScreen,
                        arguments: state.genresList?[index],
                      );
                    },
                    child: GenresItemWidget(
                        movieGenre: state.genresList![index],
                        imagePath: imagePaths[index]),
                  );
                },
              ),
            ));
        }
      },
    );
  }
}
