import '../data/searchResult.dart';

abstract class SearchStates {}

class SearchLoading extends SearchStates {}

class SearchSuccess extends SearchStates {
  List<SearchResult> results;

  SearchSuccess(this.results);

  List<SearchResult> get() {
    return results;
  }
}

class SearchFail extends SearchStates {
  String? comment;

  SearchFail(this.comment);
}

class NoSearch extends SearchStates {}
