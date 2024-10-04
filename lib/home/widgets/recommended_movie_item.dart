import 'package:cinema_craze/data/apis/models/recommended_response/Results.dart';
import 'package:cinema_craze/data/apis/models/watchlist_model/watchlist_model.dart';
import 'package:cinema_craze/home/movie_details/movie_details_widget.dart';
import 'package:cinema_craze/home/widgets/movie_item_widget.dart';
import 'package:cinema_craze/utils/colors_manager.dart';
import 'package:cinema_craze/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendedMovieItem extends StatelessWidget {
  Results? recommended;
  RecommendedMovieItem({
    this.recommended,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (recommended?.id != null) {
          //widget.recommended != null &&
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetailsScreen(
                movieId: recommended?.id ?? 0,
                recommended: recommended,
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
          watchListModel: WatchListModel(
              id: '${recommended?.id}',
              title: recommended?.title ?? 'No Title',
              image:
                  '${Constants.imagePath}${recommended?.posterPath ?? 'https://via.placeholder.com/150'} ',
              description: '${recommended?.overview}',
              releaseDate: recommended?.releaseDate ?? '',
              movieId: recommended?.id ?? 0),
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
                  const Icon(
                    Icons.star,
                    color: ColorsManager.primaryColor,
                    size: 13,
                  ),
                  SizedBox(
                    width: 9.w,
                  ),
                  Text(
                    recommended?.voteAverage?.toStringAsFixed(1) ?? '0.0',
                    style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: ColorsManager.whiteColor),
                  ),
                ],
              ),
              Text(
                '${recommended?.title}',
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.whiteColor),
              ),
              Text(
                '${recommended?.releaseDate}',
                style: const TextStyle(
                    fontSize: 10, color: ColorsManager.movieDateColor),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
