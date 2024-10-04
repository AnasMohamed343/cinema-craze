import 'package:cinema_craze/di/di.dart';
import 'package:cinema_craze/helper/provider/watchlist_provider.dart';
import 'package:cinema_craze/home/home_tab/popular_fragmant/popular_list_view_model.dart';
import 'package:cinema_craze/utils/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinema_craze/home/widgets/popular_item_widget.dart';
import 'package:provider/provider.dart';

class PopularListView extends StatefulWidget {
  @override
  State<PopularListView> createState() => _PopularListViewState();
}

class _PopularListViewState extends State<PopularListView> {
  PopularListVM viewModel = getIt.get<PopularListVM>();

  @override
  void initState() {
    super.initState();
    viewModel.fetchPopular();
  }


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
                  color:  ColorsManager.primaryColor,
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
                    viewModel.fetchPopular();
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
                style: TextStyle(color: ColorsManager.whiteColor),
              ),
            );
          }
          return CarouselSlider.builder(
            itemCount: state.popularList?.length,
            itemBuilder: (context, index, realIndex) {
              return PopularItemWidget(
                  popular: state.popularList![index]);
            },
            options: CarouselOptions(
              height: 289.h,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 30),
              enlargeCenterPage: true,
              viewportFraction: 1,
            ),
          );
        }
        return Container(); // Fallback for any other state
      },
    );
  }
}
