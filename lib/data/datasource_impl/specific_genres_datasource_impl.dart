import 'package:cinema_craze/data/apis/api_manager/api_manager.dart';
import 'package:cinema_craze/data/apis/models/specific_genres_response/specific_genre.dart';
import 'package:cinema_craze/data/datasource_contract/specific_genres_datasource.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SpecificGenresDataSource)
class SpecificGenresDSImpl extends SpecificGenresDataSource {
  ApiManager apiManager;
  @factoryMethod
  SpecificGenresDSImpl({required this.apiManager});
  @override
  Future<List<SpecificGenre>?> getSpecificGenresList(String genreId) async {
    var response = await apiManager.getSpecificGenresList(genreId);
    return response.results;
  }
}
