import 'package:flutter/cupertino.dart';

class TopSearchItemTile extends StatelessWidget {
  final String title;
  final String imageUrl;

  const TopSearchItemTile(
      {super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          // height: 100,
          height: 65,
          width: screenWidth * 0.35,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill, image: NetworkImage(imageUrl))),
        ),
        Expanded(
            child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        )),
        const Icon(
          CupertinoIcons.play_circle,
          size: 50,
        )
      ],
    );
  }
}
