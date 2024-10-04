import 'package:cinema_craze/data/apis/models/recommended_response/Results.dart';

class WatchListModel {
  String id;
  String title;
  String image;
  String description;
  String releaseDate;
  int movieId;

  WatchListModel({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.releaseDate,
    required this.movieId,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'description': description,
      'releaseDate': releaseDate,
      'movieId': movieId,
    };
  }

  static WatchListModel fromJson(Map<String, dynamic> json) {
    return WatchListModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      description: json['description'],
      releaseDate: json['releaseDate'],
      movieId: json['movieId'],
    );
  }
}
//
// List<int> watchlistMovieIds = [];
// Results? movie;
// void toggleWatchlistStatus(int movieId) {
//   if (watchlistMovieIds.contains(movieId)) {
//     watchlistMovieIds.remove(movieId);
//   } else {
//     watchlistMovieIds.add(movieId);
//   }
// }
