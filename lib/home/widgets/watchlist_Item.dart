import 'package:cinema_craze/data/apis/models/watchlist_model/watchlist_model.dart';
import 'package:cinema_craze/helper/provider/watchlist_provider.dart';
import 'package:cinema_craze/home/movie_details/movie_details_widget.dart';
import 'package:cinema_craze/utils/colors_manager.dart';
import 'package:cinema_craze/utils/assets_manager.dart';
import 'package:cinema_craze/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class WatchListItem extends StatelessWidget {
  final WatchListModel watchListModel;

  WatchListItem({super.key, required this.watchListModel});

  @override
  Widget build(BuildContext context) {
    final watchListProvider = Provider.of<WatchlistProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetailsScreen(
                movieId: watchListModel.movieId,
                watchlistModel: watchListModel,
              ),
            ),
          );
        },
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 6.0.h, horizontal: 8.w),
              child: Row(
                children: [
                  Stack(
                    alignment: const Alignment(-0.93, -0.94),
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          watchListModel.image,
                          height: 140.h,
                          width: 115.w,
                          fit: BoxFit.fill,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.error),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          watchListProvider.toggleWatchlistItem(watchListModel);
                        },
                        child: watchListProvider
                                .isFilmInWatchlist(watchListModel.id)
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
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 215.w,
                          child: Text(
                            watchListModel.title,
                            overflow: TextOverflow.visible,
                            maxLines: 2,
                            style: AppStyles.bodyMedium.copyWith(
                              fontSize: 15.sp,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          watchListModel.releaseDate,
                          style: AppStyles.bodySmall,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        SizedBox(
                          width: 215.w,
                          child: Text(
                            watchListModel.description,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: AppStyles.bodySmall,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Divider(
              color: ColorsManager.dividerColor,
            )
          ],
        ),
      ),
    );
  }
}
