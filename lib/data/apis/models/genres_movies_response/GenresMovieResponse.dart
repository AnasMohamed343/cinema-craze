import 'Genres.dart';

class GenresMovieResponse {
  GenresMovieResponse({
    this.genres,
  });

  GenresMovieResponse.fromJson(dynamic json) {
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(Genres.fromJson(v));
      });
    }
  }
  List<Genres>? genres;
  GenresMovieResponse copyWith({
    List<Genres>? genres,
  }) =>
      GenresMovieResponse(
        genres: genres ?? this.genres,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (genres != null) {
      map['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
