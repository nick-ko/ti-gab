import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:t_gab/app/util/lang/tralsation.dart';
import 'package:t_gab/app/util/util.dart';
import 'package:t_gab/presentation/components/background/background1.dart';
import 'package:t_gab/presentation/components/btn/btn_back.dart';
import 'package:t_gab/presentation/components/btn/btn_danger.dart';
import 'package:t_gab/presentation/components/btn/btn_logo.dart';
import 'package:t_gab/presentation/components/btn/btn_title.dart';
import 'package:t_gab/presentation/pages/home/main_page.dart';
import 'package:t_gab/presentation/pages/withdrawal/qrcode_scanner_page_w.dart';

class SelectOperatorPageW extends StatelessWidget {
  const SelectOperatorPageW({super.key});

  @override
  Widget build(BuildContext context) {
    return Background1(
        child: Column(
      children: [
        //TItire
        BtnTitle(title: Utils.capitalize(AppLocalizations.translate('Rerait'))),
        const SizedBox(
          height: 20,
        ),

        //Total Montant
        SizedBox(
          height: Get.height / 1.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      //Text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Utils.textTranslation("Sélectionnez votre opérateur"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              //Logo
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BtnLogo(
                    onTap: () => Get.to(() => const QrcodeScannerPageW()),
                    assetPath: 'assets/images/djamo.png',
                  ),
                  BtnLogo(
                    assetPath: 'assets/images/wave.webp',
                  ),
                  BtnLogo(
                    assetPath: 'assets/images/moov.png',
                  ),
                  BtnLogo(
                    assetPath: 'assets/images/om.png',
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BtnBack(
                      text: AppLocalizations.translate("Retour"),
                      onTap: () => Get.back(),
                    ),
                    BtnDanger(
                      text: AppLocalizations.translate("Annuler"),
                      onTap: () => Get.offAll(() => const MainPage()),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
