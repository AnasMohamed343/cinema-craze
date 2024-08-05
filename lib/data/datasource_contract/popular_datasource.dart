import 'package:cinema_craze/data/apis/models/popular_response/popular.dart';
import 'package:cinema_craze/data/apis/models/recommended_response/Results.dart';

abstract class PopularDataSource {
  Future<List<Popular>?> getPopular();
  Future<List<Popular>?> getRelease();
  Future<List<Results>?> getRecommended();
  Future<List<Popular>?> searchMovie(String query);
}
