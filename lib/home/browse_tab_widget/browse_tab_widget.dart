import 'package:cinema_craze/home/browse_tab_widget/genres_movie_list.dart';
import 'package:cinema_craze/utils/colors_manager.dart';
import 'package:flutter/material.dart';

class BrowseTabWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsManager.bgColor,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white54),
          backgroundColor: ColorsManager.bgAppBar,
          title: const Text(
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
