import 'package:cinema_craze/data/apis/models/movie_details_response/MovieDetailsResponse.dart';
import 'package:cinema_craze/data/datasource_contract/movie_details_ds.dart';
import 'package:cinema_craze/data/repository_contract/movie_details_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: MovieDetailsRepository)
class MovieDetailsRepoImpl extends MovieDetailsRepository {
  MovieDetailsDS movieDetailsDS;
  @factoryMethod
  MovieDetailsRepoImpl({required this.movieDetailsDS});
  @override
  Future<MovieDetailsResponse> getMovieDetails(int movieId) {
    return movieDetailsDS.getMovieDetails(movieId);
  }
}
