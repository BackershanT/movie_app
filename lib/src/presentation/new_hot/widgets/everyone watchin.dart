import 'package:flutter/material.dart';
import 'package:movie_app/src/core/constants.dart';

class EveryoneWatchingWidget extends StatelessWidget {
  const EveryoneWatchingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Friends",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        kheight,
        const Text(
            "fdjknszudfnosndnfnvzdonfvindfonvinfoidnv odfnivniodnfxviondiofnvoidfv jdnfxiovniodsnmxofinviodnfioxvniofndv osdfnmiovniosndfxviondfo osdnvioiniondficvr sojdxn von foxc"),
        kheight,
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            "https://m.media-amazon.com/images/I/61S+YHHA6xL._AC_UF1000,1000_QL80_.jpg",
            fit: BoxFit.cover,
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
