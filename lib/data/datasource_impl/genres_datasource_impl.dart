import 'package:cinema_craze/data/apis/api_manager/api_manager.dart';
import 'package:cinema_craze/data/apis/models/genres_movies_response/Genres.dart';
import 'package:cinema_craze/data/apis/models/genres_movies_response/GenresMovieResponse.dart';
import 'package:cinema_craze/data/datasource_contract/genres_datasource.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GenresDataSource)
class GenresDataSourceImpl extends GenresDataSource {
  ApiManager apiManager;
  @factoryMethod
  GenresDataSourceImpl({required this.apiManager});
  @override
  Future<List<Genres>?> getGenresList() async {
    var response = await apiManager.getGenresList();
    return response.genres;
  }
}
