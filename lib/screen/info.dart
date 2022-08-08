import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_app/data/fullData.dart';
import 'package:movie_app/util/util.dart';

class InfoPage extends StatelessWidget {
  FullData fullData;

  InfoPage({super.key, required this.fullData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie Information"),
      ),
      body: SingleChildScrollView(
        //physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,

        child: Column(
          children: [
            const Padding(padding: EdgeInsets.fromLTRB(0, 5, 0, 5)),

            Container(
              alignment: AlignmentDirectional.topStart,
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                fullData.name.toString(),
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  color: Colors.blueGrey,
                ),
              ),
            ),

            Container(
              alignment: AlignmentDirectional.topEnd,
              padding: const EdgeInsets.fromLTRB(0, 5, 10, 15),
              child: RatingBar.builder(
                initialRating: fullData.rating?.average ?? 0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 10,
                itemSize: 15,
                ignoreGestures: true,
                itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {},
              ),
            ),

            Center(
              child: Image(
                image: MyUtil.imageProvider(fullData.image?.medium ?? ""),
              ),
            ),

            Html(data: fullData.summary ?? ""), //give warnings

            Card(
              margin: const EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "Show Info",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.green,
                      ),
                    ),
                    const Divider(
                      height: 10,
                      thickness: 1,
                      indent: 10,
                      endIndent: 0,
                      color: Colors.grey,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Network: ",
                        ),
                        Text(
                          "${fullData.network?.name ?? "N/A"}  ",
                        ),
                        Text(
                            "(${fullData.premiered?.toString().substring(0, 4) ?? "N/A"} - ${fullData.ended?.toString().substring(0, 4) ?? "N/A"})"),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Schedule: ",
                        ),
                        Text(
                            "${fullData.schedule?.days?.join("s, ") ?? "N/A"}s at ${fullData.schedule?.time}"),
                        Text(
                            " (Runtime: ${fullData.runtime?.toString() ?? "N/A"} mins)"),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Genres: ",
                        ),
                        Text(fullData.genres?.join(" | ") ?? "N/A"),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Type: ",
                        ),
                        Text(fullData.type ?? "N/A"),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
