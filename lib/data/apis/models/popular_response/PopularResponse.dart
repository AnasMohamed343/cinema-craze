import 'package:cinema_craze/data/apis/models/popular_response/popular.dart';

class PopularResponse {
  int? page;
  List<Popular>? results;
  int? totalPages;
  int? totalResults;

  PopularResponse(
      {this.page, this.results, this.totalPages, this.totalResults});

  PopularResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Popular.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }
}
