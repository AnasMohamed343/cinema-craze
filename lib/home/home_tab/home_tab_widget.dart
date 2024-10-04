import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cinema_craze/home/home_tab/popular_fragmant/popular_list_view.dart';
import 'package:cinema_craze/home/home_tab/recommended_fragmant/recommended_list_view.dart';
import 'package:cinema_craze/home/home_tab/release_fragmant/release_list_view.dart';
import 'package:cinema_craze/home/widgets/custom_movie_list_widget.dart';

class HomeTabWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: PopularListView(),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomMovieListWidget(
                  height: 200.h,
                  data: 'New Releases',
                  childWidget: ReleaseListView(),
                ),
                SizedBox(height: 10.h),
                CustomMovieListWidget(
                  height: 246.h,
                  data: 'Recommended',
                  childWidget: RecommendedListView(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
