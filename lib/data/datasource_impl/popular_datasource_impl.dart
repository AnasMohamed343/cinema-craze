import 'package:cinema_craze/data/apis/api_manager/api_manager.dart';
import 'package:cinema_craze/data/apis/models/popular_response/popular.dart';
import 'package:cinema_craze/data/apis/models/recommended_response/Results.dart';
import 'package:cinema_craze/data/datasource_contract/popular_datasource.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PopularDataSource)
class PopularDataSourceImpl extends PopularDataSource {
  ApiManager apiManager;

  @factoryMethod
  PopularDataSourceImpl({required this.apiManager});
  @override
  Future<List<Popular>?> getPopular() async {
    var response = await apiManager.getPopular();
    return response.results;
  }

  @override
  Future<List<Results>?> getRecommended() async {
    var response = await apiManager.getRecommended();
    return response.results;
  }

  @override
  Future<List<Popular>?> getRelease() async {
    var response = await apiManager.getRelease();
    return response.results;
  }
}
