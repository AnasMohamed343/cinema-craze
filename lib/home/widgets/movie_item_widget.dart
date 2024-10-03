import 'package:cinema_craze/data/apis/models/movie_similar_response/similar.dart';
import 'package:cinema_craze/data/apis/models/popular_response/popular.dart';
import 'package:cinema_craze/data/apis/models/recommended_response/Results.dart';
import 'package:cinema_craze/data/apis/models/watchlist_model/watchlist_model.dart';
import 'package:cinema_craze/helper/provider/watchlist_provider.dart';
import 'package:cinema_craze/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MovieItemWidget extends StatelessWidget {
  Popular? popular;
  Results? recommended;
  Similar? similar;
  double? height;
  double? width;
  String src;
  WatchListModel? watchListModel;
  MovieItemWidget({
    this.height,
    this.width,
    this.popular,
    this.recommended,
    this.similar,
    required this.src,
    this.watchListModel,
  });

  @override
  Widget build(BuildContext context) {
    final watchListProvider = Provider.of<WatchlistProvider>(context);
    return Stack(
      clipBehavior: Clip.none,
      alignment: const Alignment(-0.95, -0.95),
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.network(
            height: height,
            width: width,
            fit: BoxFit.fill,
            src,
            //'${Constants.imagePath}${recommended?.posterPath ?? 'https://via.placeholder.com/150'} ',
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.error),
          ),
        ),
        // Stack(
        //   alignment: Alignment.center,
        //   children: [
        //     Icon(
        //       Icons.bookmark,
        //       color: Color(0xff514F4F).withOpacity(0.8),
        //       size: 45,
        //     ),
        //     Icon(
        //       Icons.add,
        //       color: Colors.white,
        //       size: 22,
        //     ),
        //   ],
        // ),
        InkWell(
          onTap: () {
            if (watchListModel?.id != null && watchListModel!.id.isNotEmpty) {
              watchListProvider.toggleWatchlistItem(watchListModel!);
            } else {
              print('Error: watchListModel.id is null or empty');
            }
          },
          child: watchListProvider.isFilmInWatchlist('${watchListModel?.id}')
              ? Image.asset(
                  AssetsManager.icWatchListBookmark,
                  width: 27.w,
                  height: 36.h,
                )
              : Image.asset(
                  AssetsManager.icBookmark,
                  width: 27.w,
                  height: 36.h,
                ),
        ),
      ],
    );
  }
}
