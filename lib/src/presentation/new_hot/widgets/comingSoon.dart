import 'package:flutter/material.dart';
import 'package:movie_app/src/core/constants.dart';

class ComingsoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;

  const ComingsoonWidget({
    super.key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterPath,
    required this.movieName,
    required this.description,
  });
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      children: [
         SizedBox(
          width: 80,
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                month,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                day,
                style: TextStyle(
                    fontSize: 30,
                    letterSpacing: 4,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 6000,
          width: size.width - 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Image.network(posterPath,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      bottom: 10,
                      right: 20,
                      child: CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.black.withOpacity(0.5),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.volume_off,
                            size: 30,
                          ),
                        ),
                      ))
                ],
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    movieName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(

                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Icon(Icons.notifications_none_outlined),
                          Text('Remind me'),
                        ],
                      ),
                      kWidth20,
                      Column(
                        children: [
                          Icon(Icons.info_outline),
                          Text('info'),
                        ],
                      ),
                      kWidth20
                    ],
                  )
                ],
              ),
               Text(
                "coming on $day $month",
                style: TextStyle(fontSize: 20),
              ),
              kheight,
               Text(
                movieName,
                maxLines: 1,
    overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              kheight,
               Text(description,
                maxLines: 4,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ],
    );
  }
}
