import 'package:cinema_craze/data/apis/models/popular_response/popular.dart';
import 'package:cinema_craze/home/home_tab/popular_fragmant/popular_list_view.dart';
import 'package:cinema_craze/home/home_tab/recommended_fragmant/recommended_list_widget.dart';
import 'package:cinema_craze/home/home_tab/release_fragmant/release_list_widget.dart';
import 'package:cinema_craze/home/widgets/custom_movie_list_widget.dart';
import 'package:cinema_craze/home/widgets/popular_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'recommended_fragmant/recommended_list_view.dart';
import 'release_fragmant/release_list_view.dart';

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
            child: CustomMovieListWidget(
                height: 200.h, data: 'New Releases', widget: ReleaseListView()),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10.h,
            ),
          ),
          SliverToBoxAdapter(
            child: CustomMovieListWidget(
                height: 246.h,
                data: 'Recommended',
                widget: RecommendedListView()),
          ),
        ],
      ),
    );
  }
}
