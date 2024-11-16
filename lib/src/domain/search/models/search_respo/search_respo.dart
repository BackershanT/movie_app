import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'search_respo.g.dart';

@JsonSerializable()
class SearchRespo {
  int? page;
  List<Result>? results;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  @JsonKey(name: 'total_results')
  int? totalResults;

  SearchRespo({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory SearchRespo.fromJson(Map<String, dynamic> json) {
    return _$SearchRespoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchRespoToJson(this);
}
