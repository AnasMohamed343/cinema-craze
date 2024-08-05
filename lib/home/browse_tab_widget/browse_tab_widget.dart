import 'package:cinema_craze/home/browse_tab_widget/genres_movie_list.dart';
import 'package:flutter/material.dart';

class BrowseTabWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff1E1E1E),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white54),
          backgroundColor: Color(0xff1E1E1E),
          title: Text(
            'Browse Category',
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        body: GenresMovieList(),
      ),
    );
  }
}
