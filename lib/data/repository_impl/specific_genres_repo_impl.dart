import 'package:cinema_craze/data/apis/models/specific_genres_response/specific_genre.dart';
import 'package:cinema_craze/data/datasource_contract/specific_genres_datasource.dart';
import 'package:cinema_craze/data/repository_contract/specific_genres_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SpecificGenresRepository)
class SpecificGenresRepoImpl extends SpecificGenresRepository {
  SpecificGenresDataSource specificGenresDataSource;
  @factoryMethod
  SpecificGenresRepoImpl({required this.specificGenresDataSource});
  @override
  Future<List<SpecificGenre>?> getSpecificGenresList(String genreId) {
    return specificGenresDataSource.getSpecificGenresList(genreId);
  }
}
