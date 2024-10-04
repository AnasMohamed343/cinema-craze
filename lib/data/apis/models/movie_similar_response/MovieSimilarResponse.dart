import 'similar.dart';

class MovieSimilarResponse {
  MovieSimilarResponse({
    this.page,
    this.similar,
    this.totalPages,
    this.totalResults,
  });

  MovieSimilarResponse.fromJson(dynamic json) {
    page = json['page'];
    if (json['results'] != null) {
      similar = [];
      json['results'].forEach((v) {
        similar?.add(Similar.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
  int? page;
  List<Similar>? similar;
  int? totalPages;
  int? totalResults;
  MovieSimilarResponse copyWith({
    int? page,
    List<Similar>? results,
    int? totalPages,
    int? totalResults,
  }) =>
      MovieSimilarResponse(
        page: page ?? this.page,
        similar: results ?? this.similar,
        totalPages: totalPages ?? this.totalPages,
        totalResults: totalResults ?? this.totalResults,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    if (similar != null) {
      map['results'] = similar?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }
}
