import 'package:cinema_craze/data/apis/api_manager/api_manager.dart';
import 'package:cinema_craze/data/apis/models/movie_details_response/MovieDetailsResponse.dart';
import 'package:cinema_craze/data/datasource_contract/movie_details_ds.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: MovieDetailsDS)
class MovieDetailsDSImpl extends MovieDetailsDS {
  ApiManager apiManager;

  @factoryMethod
  MovieDetailsDSImpl({required this.apiManager});
  @override
  Future<MovieDetailsResponse> getMovieDetails(int movieId) async {
    var response = await apiManager.getMovieDetails(movieId);
    return response;
  }
}
