import 'dart:convert';

import 'package:cinema_craze/data/apis/models/genres_movies_response/GenresMovieResponse.dart';
import 'package:cinema_craze/data/apis/models/movie_details_response/MovieDetailsResponse.dart';
import 'package:cinema_craze/data/apis/models/movie_similar_response/MovieSimilarResponse.dart';
import 'package:cinema_craze/data/apis/models/new_releases_response/NewReleaseResponse.dart';
import 'package:cinema_craze/data/apis/models/popular_response/PopularResponse.dart';
import 'package:cinema_craze/data/apis/models/recommended_response/RecommendedResponse.dart';
import 'package:cinema_craze/data/apis/models/specific_genres_response/SpecificGenresResponse.dart';
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
    } else {
      throw Exception('Failed to load New Released movies');
    }
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
      throw Exception('Failed to load recommended movies');
    }
  }

  Future<PopularResponse> searchMovie(String query) async {
    var uri = Uri.https(baseUrl, '/3/search/movie', {
      'api_key': apikey,
      'query': query,
    });
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      PopularResponse searchMovieResponse = PopularResponse.fromJson(json);
      return searchMovieResponse;
    } else {
      throw Exception('Failed to load search movie');
    }
  }

  Future<MovieDetailsResponse> getMovieDetails(int movieId) async {
    var uri = Uri.https(baseUrl, '/3/movie/$movieId', {
      'api_key': apikey,
    });
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      //print(json);
      MovieDetailsResponse movieDetailsResponse =
          MovieDetailsResponse.fromJson(json);
      return movieDetailsResponse;
    } else {
      throw Exception('Failed to load Details for movie');
    }
  }

  Future<MovieSimilarResponse> getSimilarMovies(int movieId) async {
    var uri = Uri.https(baseUrl, '/3/movie/$movieId/similar', {
      'api_key': apikey,
    });
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      MovieSimilarResponse movieSimilarResponse =
          MovieSimilarResponse.fromJson(json);
      return movieSimilarResponse;
    } else {
      throw Exception('Failed to load Similar movies');
    }
  }

  Future<GenresMovieResponse> getGenresList() async {
    var uri = Uri.https(baseUrl, '/3/genre/movie/list', {
      'api_key': apikey,
    });
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      GenresMovieResponse genresMovieResponse =
          GenresMovieResponse.fromJson(json);
      return genresMovieResponse;
    } else {
      throw Exception('Failed to load Genres List movies');
    }
  }

  Future<SpecificGenresResponse> getSpecificGenresList(String genreId) async {
    var uri = Uri.https(baseUrl, '/3/discover/movie',
        {'api_key': apikey, 'with_genres': genreId});
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      SpecificGenresResponse specificGenresResponse =
          SpecificGenresResponse.fromJson(json);
      return specificGenresResponse;
    } else {
      throw Exception('Failed to load Genres List movies');
    }
  }
}
