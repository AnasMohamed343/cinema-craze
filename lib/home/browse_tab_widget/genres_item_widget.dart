import 'package:cinema_craze/data/apis/models/genres_movies_response/Genres.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenresItemWidget extends StatelessWidget {
  Genres movieGenre;
  String imagePath;
  GenresItemWidget(
      {super.key, required this.movieGenre, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        //color: Colors.black54,
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
            image: AssetImage(imagePath), fit: BoxFit.cover, opacity: 0.4),
      ),
      child: Text(
        movieGenre.name ?? '',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 17,
        ),
      ),
    );
  }
}
