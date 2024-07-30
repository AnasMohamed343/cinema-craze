import 'package:cinema_craze/di/di.dart';
import 'package:cinema_craze/home/home_tab/popular_fragmant/popular_list_view_model.dart';
import 'package:cinema_craze/home/widgets/movie_item_widget.dart';
import 'package:cinema_craze/home/widgets/recommended_movie_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinema_craze/home/widgets/popular_item_widget.dart';

class RecommendedListView extends StatefulWidget {
  @override
  State<RecommendedListView> createState() => _RecommendedListViewState();
}

class _RecommendedListViewState extends State<RecommendedListView> {
  PopularListVM viewModel = getIt.get<PopularListVM>();

  @override
  void initState() {
    super.initState();
    viewModel.fetchRecommended();
  }

  // @override
  // void didUpdateWidget(covariant RecommendedListView oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   viewModel.fetchRecommended();
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
                    viewModel.fetchRecommended();
                  },
                  child: Text('Try Again'),
                ),
              ],
            ),
          );
        } else if (state is SuccessState) {
          if (state.recommendedList == null || state.recommendedList!.isEmpty) {
            return Center(
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
                return Container(
                  decoration: BoxDecoration(
                      //border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(10)),
                  height: 215.h,
                  width: 118.w,
                  child: Card(
                    color: Color(0xff282A28),
                    child: RecommendedMovieItem(
                      recommended: state.recommendedList![index],
                    ),
                  ),
                );
              },
              itemCount: state.recommendedList!.length,
            ),
          );
        }
        return Container(); // Fallback for any other state
      },
    );
  }
}
