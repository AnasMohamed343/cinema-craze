import 'package:cinema_craze/data/apis/models/specific_genres_response/specific_genre.dart';

abstract class SpecificGenresRepository {
  Future<List<SpecificGenre>?> getSpecificGenresList(String genreId);
}