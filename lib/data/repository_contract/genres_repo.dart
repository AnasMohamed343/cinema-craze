import 'package:cinema_craze/data/apis/models/genres_movies_response/Genres.dart';

abstract class GenresRepository {
  Future<List<Genres>?> getGenresList();
}
