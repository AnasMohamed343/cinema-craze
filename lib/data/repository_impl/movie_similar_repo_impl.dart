import 'package:cinema_craze/data/apis/models/movie_similar_response/similar.dart';
import 'package:cinema_craze/data/datasource_contract/movie_similar_ds.dart';
import 'package:cinema_craze/data/repository_contract/movie_similar_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SimilarMoviesRepo)
class SimilarMoviesRepoImpl extends SimilarMoviesRepo {
  SimilarMoviesDS similarMoviesDS;
  @factoryMethod
  SimilarMoviesRepoImpl({required this.similarMoviesDS});

  @override
  Future<List<Similar>?> getSimilarMovies(int movieId) {
    return similarMoviesDS.getSimilarMovies(movieId);
  }
}
