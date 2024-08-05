import 'package:cinema_craze/data/apis/models/popular_response/popular.dart';
import 'package:cinema_craze/data/apis/models/recommended_response/Results.dart';
import 'package:cinema_craze/data/datasource_contract/popular_datasource.dart';
import 'package:cinema_craze/data/repository_contract/popular_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PopularRepository)
class PopularRepositoryImpl extends PopularRepository {
  PopularDataSource popularDataSource;

  @factoryMethod
  PopularRepositoryImpl({required this.popularDataSource});
  @override
  Future<List<Popular>?> getPopular() {
    return popularDataSource.getPopular();
  }

  @override
  Future<List<Popular>?> getRelease() {
    return popularDataSource.getRelease();
  }

  @override
  Future<List<Results>?> getRecommended() {
    return popularDataSource.getRecommended();
  }

  @override
  Future<List<Popular>?> searchMovie(String query) {
    return popularDataSource.searchMovie(query);
  }
}
