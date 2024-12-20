import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

class HomeMainCard extends StatelessWidget {
  final String imageUrl;

  const HomeMainCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          height: 150,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.green,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    imageUrl,
                  ))),
        ));
  }
}

class HomeMainCardTwo extends StatelessWidget {
  const HomeMainCardTwo({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Stack(children: [
          Row(children: [
            const SizedBox(
              width: 40,
              height: 150,
            ),
            Container(
              height: 150,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        imageUrl,
                      ))),
            )
          ]),
          Positioned(
            left: 10,
            bottom: 0,
            child: BorderedText(
              strokeWidth: 10.0,
              strokeCap: StrokeCap.butt,
              child: Text(
                "1",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 120,
                    decoration: TextDecoration.none,
                    color: Colors.grey),
              ),
            ),
          ),
        ]));
  }
}
