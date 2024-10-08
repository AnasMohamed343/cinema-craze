import 'specific_genre.dart';

class SpecificGenresResponse {
  SpecificGenresResponse({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  SpecificGenresResponse.fromJson(dynamic json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(SpecificGenre.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
  int? page;
  List<SpecificGenre>? results;
  int? totalPages;
  int? totalResults;
  SpecificGenresResponse copyWith({
    int? page,
    List<SpecificGenre>? results,
    int? totalPages,
    int? totalResults,
  }) =>
      SpecificGenresResponse(
        page: page ?? this.page,
        results: results ?? this.results,
        totalPages: totalPages ?? this.totalPages,
        totalResults: totalResults ?? this.totalResults,
      );
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
