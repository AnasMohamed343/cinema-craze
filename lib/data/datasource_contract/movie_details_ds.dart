import 'package:cinema_craze/data/apis/models/movie_details_response/MovieDetailsResponse.dart';

abstract class MovieDetailsDS {
  Future<MovieDetailsResponse> getMovieDetails(int movieId);
}
