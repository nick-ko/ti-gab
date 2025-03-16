import 'package:flutter/material.dart';
import 'package:t_gab/app/config/app_colors.dart';
import 'package:t_gab/app/util/lang/tralsation.dart';
import 'package:t_gab/app/util/util.dart';
import 'package:t_gab/presentation/components/background/background1.dart';
import 'package:t_gab/presentation/components/btn/btn_title.dart';

class QrcodeScannerPage extends StatelessWidget {
  const QrcodeScannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Background1(
        child: Column(
      children: [
        //titre
        BtnTitle(title: Utils.capitalize(AppLocalizations.translate('dépôt'))),
        const SizedBox(
          height: 20,
        ),

        Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              //Instruction et total
              Column(
                children: [
                  Utils.textTranslation("Total: 650.000 XOF"),
                  Container(
                      padding: EdgeInsets.all(5),
                      width: 250,
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(15),
                          color: Colors.white.withOpacity(0.4),
                          border:
                              Border.all(color: AppColors.orange, width: 1)),
                      child: ListView(
                        children: [
                          Text(
                            "1- Instruction 1",
                            style: TextStyle(
                                color: AppColors.orange, fontSize: 25),
                          ),
                          Text(
                            "2- Instruction 2",
                            style: TextStyle(
                                color: AppColors.orange, fontSize: 25),
                          ),
                          Text(
                            "3- Instruction 3",
                            style: TextStyle(
                                color: AppColors.orange, fontSize: 25),
                          ),
                        ],
                      )),
                ],
              ),

              //Bloc de scann QrCode
              Column(
                children: [
                  Container(
                      padding: EdgeInsets.all(5),
                      width: 250,
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(15),
                          color: Colors.white,
                          border:
                              Border.all(color: AppColors.orange, width: 1)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset("assets/images/qr-code.png"),
                          Text(
                            "Présentez votre QrCode",
                            style: TextStyle(
                                color: AppColors.textBlue,
                                fontWeight: FontWeight.w700,
                                fontSize: 20),
                          ),
                        ],
                      )),
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
