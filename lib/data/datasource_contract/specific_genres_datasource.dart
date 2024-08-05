import 'package:cinema_craze/data/apis/models/specific_genres_response/specific_genre.dart';

abstract class SpecificGenresDataSource {
  Future<List<SpecificGenre>?> getSpecificGenresList(String genreId);
}
