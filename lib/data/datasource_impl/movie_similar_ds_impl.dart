import 'package:cinema_craze/data/apis/api_manager/api_manager.dart';
import 'package:cinema_craze/data/apis/models/movie_similar_response/similar.dart';
import 'package:cinema_craze/data/datasource_contract/movie_similar_ds.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SimilarMoviesDS)
class SimilarMoviesDsImpl extends SimilarMoviesDS {
  ApiManager apiManager;
  @factoryMethod
  SimilarMoviesDsImpl({required this.apiManager});

  @override
  Future<List<Similar>?> getSimilarMovies(int movieId) async {
    var response = await apiManager.getSimilarMovies(movieId);
    return response.similar;
  }
}
