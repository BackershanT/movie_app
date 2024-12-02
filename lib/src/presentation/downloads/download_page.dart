import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/src/application/downloads/downloads_bloc.dart';
import 'package:movie_app/src/core/const.dart';
import 'package:movie_app/src/core/constants.dart';
import 'package:movie_app/src/presentation/downloads/widgets/download_images.dart';
import 'package:movie_app/src/presentation/widget/app_bar_widget.dart';

class DownloadPage extends StatelessWidget {
  const DownloadPage({super.key});



  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImage());
    });

    // BlocProvider.of<DownloadsBloc>(context)
    //     .add(DownloadsEvent.getDownloadsImage());

    final Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            appBar: const PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: AppBarWidget(
                title: "Downloads",
              ),
            ),
            body: ListView(
              children: [
                const Row(
                  children: [
                    kWidth,
                    Icon(Icons.settings_outlined),
                    kWidth,
                    Text(
                      "Smart Downloads",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                const Text("Indrocing Downloads For you"),
                const Text(
                    "We will Download a Personalized selection of movies and shows for you . so there is always for  you"),
                BlocBuilder<DownloadsBloc, DownloadsState>(
                  builder: (context, state) {
                    return SizedBox(
                      width: size.width,
                      height: size.width,
                      child: state.isLoading
                          ? const Center(child: CircularProgressIndicator()
                      ) :
                      Stack(
                              alignment: Alignment.center,
                              children: [
                                Center(
                                    child: CircleAvatar(
                                  radius: size.width * 0.40,
                                )),
                                DownloadImages(
                                  imageList:
                                      '$imageAppendUrl${state.downloads?[0].posterPath}',
                                  angle: 20,
                                  margin: const EdgeInsets.only(
                                      left: 130, bottom: 50),
                                  size: Size(
                                      size.width * 0.4, size.height * 0.27),
                                ),
                                DownloadImages(
                                  imageList:
                                      '$imageAppendUrl${state.downloads?[1].posterPath}',
                                  angle: -20,
                                  margin: const EdgeInsets.only(
                                      right: 130, bottom: 50),
                                  size: Size(
                                      size.width * 0.4, size.height * 0.27),
                                ),
                                DownloadImages(
                                  imageList:
                                      '$imageAppendUrl${state.downloads?[2].posterPath}',
                                  angle: 0,
                                  margin: const EdgeInsets.only(bottom: 10),
                                  size: Size(
                                      size.width * 0.4, size.height * 0.27),
                                ),
                              ],
                            ),
                    );
                  },
                ),
                MaterialButton(
                  color: Colors.blue,
                  onPressed: () {},
                  child: const Text('Setup'),
                ),
                MaterialButton(
                  color: Colors.white,
                  onPressed: () {},
                  child: const Text('See what you can download'),
                )
              ],
            )));
  }
}
