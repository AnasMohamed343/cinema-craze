import 'package:cinema_craze/data/apis/models/watchlist_model/watchlist_model.dart';
import 'package:cinema_craze/helper/provider/watchlist_provider.dart';
import 'package:cinema_craze/home/widgets/watchlist_Item.dart';
import 'package:cinema_craze/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class WatchListTabWidget extends StatelessWidget {
  const WatchListTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<WatchListModel> films =
        Provider.of<WatchlistProvider>(context).watchlistFilms;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 25.h),
            Text(
              'Watchlist',
              style: AppStyles.bodyLarge,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return WatchListItem(watchListModel: films[index]);
                },
                itemCount: films.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
