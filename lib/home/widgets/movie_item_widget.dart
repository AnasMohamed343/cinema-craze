import 'package:cinema_craze/data/apis/models/movie_similar_response/similar.dart';
import 'package:cinema_craze/data/apis/models/popular_response/popular.dart';
import 'package:cinema_craze/data/apis/models/recommended_response/Results.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants.dart';

class MovieItemWidget extends StatelessWidget {
  Popular? popular;
  Results? recommended;
  Similar? similar;
  double? height;
  double? width;
  String src;
  MovieItemWidget(
      {this.height,
      this.width,
      this.popular,
      this.recommended,
      this.similar,
      required this.src});
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.topStart,
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
        Stack(
          alignment: Alignment.center,
          children: [
            Icon(
              Icons.bookmark,
              color: Color(0xff514F4F).withOpacity(0.8),
              size: 53,
            ),
            Icon(
              Icons.add,
              color: Colors.white,
              size: 25,
            ),
          ],
        ),
      ],
    );
  }
}
