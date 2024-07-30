import 'dart:convert';

import 'package:cinema_craze/data/apis/models/new_releases_response/NewReleaseResponse.dart';
import 'package:cinema_craze/data/apis/models/popular_response/PopularResponse.dart';
import 'package:cinema_craze/data/apis/models/recommended_response/RecommendedResponse.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  static const String baseUrl = 'api.themoviedb.org';
  static const String apikey = '7715b1977da773ce72a1dc0325c99770';
  //https://api.themoviedb.org/3/movie/popular?api_key=7715b1977da773ce72a1dc0325c99770
  Future<PopularResponse> getPopular() async {
    var uri = Uri.https(baseUrl, '/3/movie/popular', {
      'api_key': apikey,
    });
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      PopularResponse popularResponse = PopularResponse.fromJson(json);
      return popularResponse;
    } else {
      throw Exception('Failed to load popular movies');
    }
  }

  Future<NewReleaseResponse> getRelease() async {
    var uri = Uri.https(baseUrl, '/3/movie/upcoming', {
      'api_key': apikey,
    });
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      NewReleaseResponse newReleaseResponse = NewReleaseResponse.fromJson(json);
      return newReleaseResponse;
    } else
      throw Exception('Failed to load New Released movies');
  }

  Future<RecommendedResponse> getRecommended() async {
    var uri = Uri.https(baseUrl, '/3/movie/top_rated', {
      'api_key': apikey,
    });
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      RecommendedResponse recommendedResponse =
          RecommendedResponse.fromJson(json);
      return recommendedResponse;
    } else {
      throw Exception('Failed to load New Released movies');
    }
  }
}
