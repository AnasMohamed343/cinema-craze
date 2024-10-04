import 'package:cinema_craze/data/apis/models/movie_similar_response/similar.dart';
import 'package:cinema_craze/data/apis/models/watchlist_model/watchlist_model.dart';
import 'package:cinema_craze/home/movie_details/movie_details_widget.dart';
import 'package:cinema_craze/home/widgets/movie_item_widget.dart';
import 'package:cinema_craze/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/colors_manager.dart';

class SimilarMovieItem extends StatefulWidget {
  Similar? similar;
  SimilarMovieItem({
    this.similar,
  });

  @override
  State<SimilarMovieItem> createState() => _SimilarMovieItemState();
}

class _SimilarMovieItemState extends State<SimilarMovieItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.similar != null && widget.similar!.id != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetailsScreen(
                movieId: widget.similar!.id!,
                similar: widget.similar!,
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
              id: '${widget.similar?.id}',
              title: widget.similar?.title ?? 'No Title',
              image:
                  '${Constants.imagePath}${widget.similar?.posterPath ?? 'https://via.placeholder.com/150'} ',
              description: '${widget.similar?.overview}',
              releaseDate: widget.similar?.releaseDate ?? '',
              movieId: widget.similar?.id ?? 0),
          src:
              '${Constants.imagePath}${widget.similar?.posterPath ?? 'https://via.placeholder.com/150'} ',
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
                    widget.similar!.voteAverage!.toStringAsFixed(1),
                    style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: ColorsManager.whiteColor),
                  ),
                ],
              ),
              Text(
                '${widget.similar?.title}',
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.whiteColor),
              ),
              Text(
                '${widget.similar?.releaseDate}',
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
