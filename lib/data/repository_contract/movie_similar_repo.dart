import 'package:cinema_craze/data/apis/models/movie_similar_response/similar.dart';

abstract class SimilarMoviesRepo {
  Future<List<Similar>?> getSimilarMovies(int movieId);
}
