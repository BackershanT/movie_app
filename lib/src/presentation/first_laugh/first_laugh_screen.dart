import 'package:flutter/material.dart';
import 'package:movie_app/src/presentation/first_laugh/widget/vedio_list_item.dart';

class FirstLaughScreen extends StatelessWidget {
  const FirstLaughScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: PageView(

              scrollDirection: Axis.vertical,
      children:
        List.generate(10, (index) {
          return VedioListItem(index: index,);
        })

    )));
  }
}
