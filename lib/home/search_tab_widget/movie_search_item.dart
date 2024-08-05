import 'package:cinema_craze/data/apis/models/popular_response/popular.dart';
import 'package:cinema_craze/data/apis/models/specific_genres_response/specific_genre.dart';
import 'package:cinema_craze/home/movie_details/movie_details_widget.dart';
import 'package:cinema_craze/utils/constants.dart';
import 'package:cinema_craze/utils/reusable_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieSearchItem extends StatelessWidget {
  Popular? popular;
  SpecificGenre? specificGenre;
  String src, title, voteAverage, releaseDate;
  MovieSearchItem(
      {this.popular,
      this.specificGenre,
      required this.src,
      required this.title,
      required this.voteAverage,
      required this.releaseDate});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (popular?.id != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetailsScreen(
                movieId: popular!.id!,
                popular: popular,
              ),
            ),
          );
        } else if (specificGenre?.id != null) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MovieDetailsScreen(
                  movieId: specificGenre!.id!,
                  specificGenre: specificGenre,
                ),
              ));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Movie ID is null'),
            ),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 11),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              // borderRadius: BorderRadius.only(
              //     topLeft: Radius.circular(7), bottomLeft: Radius.circular(7)),
              child: Image.network(
                height: 130.h,
                width: 180.w,
                fit: BoxFit.fill,
                src,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.error),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 9.h,
                    ),
                    Text(
                      releaseDate,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 25,
                        ),
                        SizedBox(
                          width: 9.w,
                        ),
                        Text(
                          voteAverage,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
