import 'package:cinema_craze/data/apis/models/popular_response/popular.dart';
import 'package:cinema_craze/home/movie_details/movie_details_widget.dart';
import 'package:cinema_craze/home/widgets/movie_item_widget.dart';
import 'package:cinema_craze/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReleaseMovieItem extends StatelessWidget {
  Popular? popular;
  ReleaseMovieItem({this.popular});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (popular?.id != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetailsScreen(
                movieId: popular!.id!,
                popular: popular!,
              ),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Movie ID is null'),
            ),
          );
        }
      },
      child: MovieItemWidget(
        src:
            '${Constants.imagePath}${popular?.posterPath ?? 'https://via.placeholder.com/150'} ',
        height: 143.h,
        width: 120.w,
      ),
    );
  }
}
