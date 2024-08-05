import 'package:cinema_craze/data/apis/models/genres_movies_response/Genres.dart';
import 'package:cinema_craze/data/datasource_contract/genres_datasource.dart';
import 'package:cinema_craze/data/repository_contract/genres_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GenresRepository)
class GenresRepositoryImpl extends GenresRepository {
  GenresDataSource genresDataSource;
  @factoryMethod
  GenresRepositoryImpl({required this.genresDataSource});
  @override
  Future<List<Genres>?> getGenresList() {
    return genresDataSource.getGenresList();
  }
}
