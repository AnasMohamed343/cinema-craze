import 'package:cinema_craze/di/di.dart';
import 'package:cinema_craze/home/home_tab/popular_fragmant/popular_list_view_model.dart';
import 'package:cinema_craze/home/home_tab/release_fragmant/release_movie_item.dart';
import 'package:cinema_craze/utils/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReleaseListView extends StatefulWidget {
  @override
  State<ReleaseListView> createState() => _ReleaseListViewState();
}

class _ReleaseListViewState extends State<ReleaseListView> {
  PopularListVM viewModel = getIt.get<PopularListVM>();

  @override
  void initState() {
    super.initState();
    viewModel.fetchRelease();
  }

  // @override
  // void didUpdateWidget(covariant ReleaseListView oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   viewModel.fetchRelease();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularListVM, PopularListState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is LoadingState) {
          return Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(
                  color: ColorsManager.primaryColor,
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
                    viewModel.fetchRelease();
                  },
                  child: const Text('Try Again'),
                ),
              ],
            ),
          );
        } else if (state is SuccessState) {
          if (state.popularList == null || state.popularList!.isEmpty) {
            return const Center(
              child: Text(
                'No popular movies found.',
                style: TextStyle(color: Colors.white),
              ),
            );
          }
          return Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                width: 15.w,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ReleaseMovieItem(
                  popular: state.popularList![index],
                );
              },
              itemCount: state.popularList!.length,
            ),
          );
        }
        return Container(); // Fallback for any other state
      },
    );
  }
}
