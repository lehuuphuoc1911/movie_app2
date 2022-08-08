import 'package:flutter/material.dart';
import 'package:movie_app/data/searchResult.dart';
import 'package:movie_app/screen/info.dart';
import 'package:movie_app/searchBloc/SearchBloc.dart';
import 'package:movie_app/searchBloc/SearchEvents.dart';
import 'package:movie_app/searchBloc/SearchState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/util/util.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchBloc>(
      create: (context) => SearchBloc(NoSearch()),
      child: const MovieSearchPage(),
    );
  }
}

class MovieSearchPage extends StatelessWidget {
  const MovieSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SearchBloc searchBloc = BlocProvider.of<SearchBloc>(context);
    final textBoxController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Search a Movie"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a movie name',
              ),
              controller: textBoxController,
            ),
            ElevatedButton(
                onPressed: () {
                  String s = textBoxController.text
                      .toString()
                      .trim()
                      .replaceAll(' ', '-');
                  if (s.isNotEmpty) {
                    searchBloc.add(SearchMovie(s));
                  } else {
                    textBoxController.clear();
                  }
                },
                child: const Text("Search")),
            BlocBuilder<SearchBloc, SearchStates>(
              builder: (context, state) {
                if (state is SearchLoading) {
                  return const CircularProgressIndicator();
                } else if (state is NoSearch) {
                  return const Text(
                      "Enter the movie name the press search button");
                } else if (state is SearchSuccess) {
                  //return Text(state.fullData.url.toString());
                  return resultBlocks(context, state.results);
                } else if (state is SearchFail) {
                  return Text(state.comment.toString());
                }
                return const Text("what happen ?");
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget resultBlocks(BuildContext context, List<SearchResult> results) {
    //List<Widget> listMovie;
    //listMovie = results.map((r) => movieBlock(context, r)).toList();

    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding: const EdgeInsets.all(5),
          itemCount: results.length,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            InfoPage(fullData: results[index].show!),
                      ),
                    );
                  },
                  child: Image(
                    image: MyUtil.imageProvider(
                        results[index].show?.image?.medium.toString() ?? ""),
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                ),
                Text(results[index].show?.name?.toString() ?? "N/A")
              ],
            );
          }),
    );
  }

  Widget movieBlock(BuildContext context, SearchResult result) {
    return Row(
      children: [
        Padding(
            padding: EdgeInsets.only(left: 10),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/info");
              },
              child: Image(
                image: MyUtil.imageProvider(
                    result.show?.image?.medium.toString() ?? ""),
              ),
            )),
      ],
    );
  }
}
