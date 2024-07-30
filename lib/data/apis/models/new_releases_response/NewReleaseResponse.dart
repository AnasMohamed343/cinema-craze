import 'package:cinema_craze/data/apis/models/popular_response/popular.dart';

import 'Dates.dart';

class NewReleaseResponse {
  NewReleaseResponse({
    this.dates,
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  NewReleaseResponse.fromJson(dynamic json) {
    dates = json['dates'] != null ? Dates.fromJson(json['dates']) : null;
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
  Dates? dates;
  int? page;
  List<Popular>? results;
  int? totalPages;
  int? totalResults;
  NewReleaseResponse copyWith({
    Dates? dates,
    int? page,
    List<Popular>? results,
    int? totalPages,
    int? totalResults,
  }) =>
      NewReleaseResponse(
        dates: dates ?? this.dates,
        page: page ?? this.page,
        results: results ?? this.results,
        totalPages: totalPages ?? this.totalPages,
        totalResults: totalResults ?? this.totalResults,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (dates != null) {
      map['dates'] = dates?.toJson();
    }
    map['page'] = page;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }
}
