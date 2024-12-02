import 'package:flutter/material.dart';
import 'package:movie_app/src/core/constants.dart';

class ComingsoonWidget extends StatelessWidget {
  const ComingsoonWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      children: [
        const SizedBox(
          width: 80,
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Feb',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '11',
                style: TextStyle(
                    fontSize: 30,
                    letterSpacing: 4,
                    color: Colors.white,
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
                    child: Image.network(
                      fit: BoxFit.cover,
                      "https://m.media-amazon.com/images/I/61S+YHHA6xL._AC_UF1000,1000_QL80_.jpg",
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tall Girl",
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
              const Text(
                "coming soon",
                style: TextStyle(fontSize: 20),
              ),
              kheight,
              const Text(
                "Taall girl 2",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              kheight,
              const Text(
                "djfnikd fskodzmskldmf efdsmzkxklsmdf slkldfmlsm.dfkl sdjfjmlksmfxdlv jsdlfnsmdzflk kjlnzdfxkcmsdlx slzdfx,nvkldsn.zxv lsdnflvnslkdvx lk ldnfvln dsxkln fvkldskfmklsmdfl ksdfm;lsmdf;l dfsklms;md fks dkf sk dfks dfk sdkf ksedf ksd fk dskf ks dfkl sdk fks dfvk dfk kdf odfkxn vl df vkldf xklv d v vojd oj voj ojadfkomlksmdflk asfldfzkxmsdfk.m  2",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ],
    );
  }
}
