import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:t_gab/app/config/app_colors.dart';
import 'package:t_gab/app/util/lang/tralsation.dart';
import 'package:t_gab/app/util/util.dart';
import 'package:t_gab/presentation/components/background/background1.dart';
import 'package:t_gab/presentation/components/btn/btn_logo.dart';
import 'package:t_gab/presentation/components/btn/btn_title.dart';
import 'package:t_gab/presentation/components/deposit/row_deposit.dart';
import 'package:t_gab/presentation/pages/deposit/qrcode_scanner_page.dart';
import 'package:t_gab/presentation/pages/qr_code/qr_code_scanner_screen.dart';

class SelectOperatorPage extends StatelessWidget {
  const SelectOperatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Background1(
        child: Column(
      children: [
        //TItire
        BtnTitle(title: Utils.capitalize(AppLocalizations.translate('dépôt'))),
        const SizedBox(
          height: 20,
        ),

        //Total Montant
        SizedBox(
          height: Get.width / 2.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Message...",
                        style: TextStyle(fontSize: 25),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.textBlue, width: 2)),
                        height: 250,
                        child: ListView(
                          children: const [
                            RowDeposit(
                              montant: '250.000 XOF',
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            RowDeposit(
                              montant: '400.000 XOF',
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            RowDeposit(
                              montant: '400.000 XOF',
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            RowDeposit(
                              montant: '400.000 XOF',
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            RowDeposit(
                              montant: '400.000 XOF',
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            RowDeposit(
                              montant: '400.000 XOF',
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            RowDeposit(
                              montant: '400.000 XOF',
                            ),
                          ],
                        ),
                      ),
                      //Total
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            AppLocalizations.translate("Total: 4 000 000 XOF"),
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textBlue),
                          )
                        ],
                      ),

                      //Text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.translate(
                                "Sélectionnez votre opérateur"),
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textBlue),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              //Btn menu
              //Logo
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BtnLogo(
                      onTap: () => Get.to(() => const QrcodeScannerPage()),
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
              )
            ],
          ),
        ),
      ],
    ));
  }
}
