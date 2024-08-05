import 'package:cinema_craze/data/apis/models/genres_movies_response/Genres.dart';

abstract class GenresDataSource {
  Future<List<Genres>?> getGenresList();
}
