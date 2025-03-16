import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:t_gab/app/util/lang/tralsation.dart';
import 'package:t_gab/presentation/components/background/background1.dart';
import 'package:t_gab/presentation/components/btn/btn_langue.dart';
import 'package:t_gab/presentation/components/video_player/video_player.dart';
import 'package:t_gab/presentation/pages/deposit/operation_choice_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Background1(
        child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /* Bloc de video */
            const Padding(
              padding: EdgeInsets.only(left: 15),
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
                  BtnLangue(
                      text: 'Français',
                      onTap: () {
                        AppLocalizations.changeLanguage('fr');
                        Get.to(() => const OperationChoicePage());
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  BtnLangue(
                      text: 'English',
                      onTap: () {
                        AppLocalizations.changeLanguage('en');
                        Get.to(() => const OperationChoicePage());
                      }),
                ],
              ),
            )
          ],
        ),
      ],
    ));
  }
}
