import 'package:cinema_craze/data/apis/models/popular_response/popular.dart';
import 'package:cinema_craze/home/movie_details/movie_details_widget.dart';
import 'package:cinema_craze/home/widgets/play_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants.dart';
import 'movie_item_widget.dart';

class PopularItemWidget extends StatelessWidget {
  Popular popular;
  PopularItemWidget({required this.popular});
  @override
  Widget build(BuildContext context) {
    //print('Popular ID: ${popular.id}');
    return InkWell(
      onTap: () {
        if (popular.id != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetailsScreen(
                movieId: popular.id!,
                popular: popular,
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
      child: Container(
        height: 292.h,
        color: Color(0xff121312),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.topStart,
          children: [
            Image.network(
              '${Constants.imagePath}${popular.backdropPath ?? 'https://via.placeholder.com/150'} ',
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.error),
              fit: BoxFit.cover,
              width: double.infinity,
              height: 213.h,
            ),
            Positioned(
              top: 85.h,
              left: 30.h,
              child: Row(
                children: [
                  MovieItemWidget(
                    popular: popular,
                    height: 190.h,
                    width: 140.w,
                    src:
                        '${Constants.imagePath}${popular.posterPath ?? 'https://via.placeholder.com/150'} ',
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 110,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          popular.title ?? 'No Title',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        SizedBox(
                          height: 4.w,
                        ),
                        Text(
                          popular.releaseDate ?? '',
                          style:
                              TextStyle(color: Color(0xffB5B4B4), fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(top: 78.h, left: 190.h, child: PlayButton()),
          ],
        ),
      ),
    );
  }
}
