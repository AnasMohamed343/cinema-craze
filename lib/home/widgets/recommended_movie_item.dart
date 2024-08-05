import 'package:cinema_craze/data/apis/models/recommended_response/Results.dart';
import 'package:cinema_craze/home/movie_details/movie_details_widget.dart';
import 'package:cinema_craze/home/widgets/movie_item_widget.dart';
import 'package:cinema_craze/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendedMovieItem extends StatelessWidget {
  Results? recommended;
  RecommendedMovieItem({this.recommended});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (recommended != null && recommended!.id != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetailsScreen(
                movieId: recommended!.id!,
                recommended: recommended!,
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
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        MovieItemWidget(
          src:
              '${Constants.imagePath}${recommended?.posterPath ?? 'https://via.placeholder.com/150'} ',
          height: 122.h,
          width: 120.w,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 2, left: 8, bottom: 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 13,
                  ),
                  SizedBox(
                    width: 9.w,
                  ),
                  Text(
                    recommended!.voteAverage!.toStringAsFixed(1),
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ],
              ),
              Text(
                '${recommended?.title}',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                '${recommended?.releaseDate}',
                style: TextStyle(fontSize: 10, color: Colors.white60),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
