import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:movie_app/searchBloc/SearchEvents.dart';
import 'package:movie_app/searchBloc/SearchState.dart';
import 'package:http/http.dart';
import 'package:movie_app/util/util.dart';

import '../data/searchResult.dart';

class SearchBloc extends Bloc<SearchEvents, SearchStates> {
  late List<SearchResult> results;

  SearchBloc(super.initialState);

  @override
  Stream<SearchStates> mapEventToState(SearchEvents event) async* {
    if (event is SearchMovie) {
      yield SearchLoading();
      String searchKey = event.key;
      String url = "https://api.tvmaze.com/search/shows?q=$searchKey";
      try {
        Response response = await get(Uri.parse(url));
        List<dynamic> data = await jsonDecode(response.body).toList();
        if (data.isNotEmpty) {
          results = data.map((i) => SearchResult.fromJson(i)).toList();
          yield SearchSuccess(results);
        } else {
          yield SearchFail(MyUtil.dataNullError);
        }
      } catch (e) {
        yield SearchFail(MyUtil.noResponseError);
      }
    }
  }
}
