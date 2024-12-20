import 'package:flutter/material.dart';
import 'package:movie_app/src/core/const.dart';
import 'package:movie_app/src/core/constants.dart';

class EveryoneWatchingWidget extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String description;
  const EveryoneWatchingWidget(
      {super.key,
      required this.posterPath,
      required this.movieName,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          movieName,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        kheight,
        Text(description),
        kheight,
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            "$imageAppendUrl$posterPath",
            fit: BoxFit.cover,
            loadingBuilder:
                (BuildContext _, Widget child, ImageChunkEvent? progress) {
              if (progress == null) {
                return child;
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                );
              }
            },
            errorBuilder: (BuildContext _, Object a, StackTrace? trace) {
              return Icon(Icons.wifi);
            },
          ),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [Icon(Icons.share), Text("Share")],
            ),
            kWidth20,
            Column(
              children: [Icon(Icons.add), Text("My list")],
            ),
            kWidth20,
            Column(
              children: [Icon(Icons.play_arrow_outlined), Text("Play")],
            ),
            kWidth20
          ],
        )
      ],
    );
  }
}
