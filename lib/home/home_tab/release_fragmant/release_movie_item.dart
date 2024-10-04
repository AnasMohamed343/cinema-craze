import 'package:cinema_craze/data/apis/models/popular_response/popular.dart';
import 'package:cinema_craze/data/apis/models/watchlist_model/watchlist_model.dart';
import 'package:cinema_craze/home/movie_details/movie_details_widget.dart';
import 'package:cinema_craze/home/widgets/movie_item_widget.dart';
import 'package:cinema_craze/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReleaseMovieItem extends StatefulWidget {
  Popular? popular;
  ReleaseMovieItem({
    this.popular,
  });

  @override
  State<ReleaseMovieItem> createState() => _ReleaseMovieItemState();
}

class _ReleaseMovieItemState extends State<ReleaseMovieItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.popular?.id != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetailsScreen(
                movieId: widget.popular!.id!,
                popular: widget.popular!,
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
        watchListModel: WatchListModel(
            id: '${widget.popular?.id}',
            title: widget.popular?.title ?? 'No Title',
            image:
                '${Constants.imagePath}${widget.popular?.posterPath ?? 'https://via.placeholder.com/150'} ',
            description: '${widget.popular?.overview}',
            releaseDate: widget.popular?.releaseDate ?? '',
            movieId: widget.popular?.id ?? 0),
        src:
            '${Constants.imagePath}${widget.popular?.posterPath ?? 'https://via.placeholder.com/150'} ',
        height: 143.h,
        width: 120.w,
      ),
    );
  }
}
