import 'package:movie_app/data/fullData.dart';

class SearchResult {
  double? score;
  FullData? show;

  SearchResult({this.score, this.show});

  factory SearchResult.fromJson(Map<String, dynamic> json) => SearchResult(
        score: json["score"],
        show: FullData.fromJson(json["show"]),
      );
}
