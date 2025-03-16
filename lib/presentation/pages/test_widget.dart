import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:t_gab/app/util/lang/tralsation.dart';
import 'package:t_gab/presentation/components/background/background1.dart';
import 'package:t_gab/presentation/components/btn/btn_langue.dart';
import 'package:t_gab/presentation/components/btn/btn_title.dart';
import 'package:t_gab/presentation/components/video_player/video_player.dart';
import 'package:translator/translator.dart';

class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Background1(
        child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /* Bloc de video */
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: AdVideoCarousel(
                  width: 800,
                  height: 630,
                  videoUrls: [
                    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
                    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4'
                  ],
                ),
              ),
            ),

            /* Bloc btn* langue*/
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Column(
                children: [
                  BtnLangue(text: 'Français'),
                  SizedBox(
                    height: 20,
                  ),
                  BtnLangue(text: 'English'),
                ],
              ),
            )
          ],
        ),
      ],
    ));
  }
}
