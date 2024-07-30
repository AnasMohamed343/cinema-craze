import 'package:cinema_craze/data/apis/models/popular_response/popular.dart';
import 'package:cinema_craze/home/widgets/movie_item_widget.dart';
import 'package:cinema_craze/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReleaseMovieItem extends StatelessWidget {
  Popular? popular;
  ReleaseMovieItem({this.popular});
  @override
  Widget build(BuildContext context) {
    return MovieItemWidget(
      src:
          '${Constants.imagePath}${popular?.backdropPath ?? 'https://via.placeholder.com/150'} ',
      height: 143.h,
      width: 110.w,
    );
  }
}
