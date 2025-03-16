import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:t_gab/app/config/app_colors.dart';
import 'package:t_gab/app/util/lang/tralsation.dart';
import 'package:t_gab/app/util/util.dart';
import 'package:t_gab/presentation/components/background/background1.dart';
import 'package:t_gab/presentation/components/btn/btn_add_again.dart';
import 'package:t_gab/presentation/components/btn/btn_danger.dart';
import 'package:t_gab/presentation/components/btn/btn_success_next.dart';
import 'package:t_gab/presentation/components/btn/btn_title.dart';
import 'package:t_gab/presentation/pages/deposit/select_operator_page.dart';

class SumDepositPage extends StatelessWidget {
  const SumDepositPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Background1(
        child: Column(
      children: [
        //TItire
        BtnTitle(title: Utils.capitalize(AppLocalizations.translate('dépôt'))),
        SizedBox(
          height: 20,
        ),
        //Total Montant
        SizedBox(
          height: Get.width / 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Utils.textTranslation("Montant total:"),
                      Container(
                        width: 650,
                        height: 100,
                        decoration: BoxDecoration(
                            color: AppColors.textBlue,
                            border:
                                Border.all(color: AppColors.orange, width: 4),
                            borderRadius: BorderRadius.circular(15)),
                        child: const Center(
                          child: Text(
                            "250.000 XOF",
                            style: TextStyle(
                                fontSize: 80,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              //Btn menu
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BtnAddAgain(
                      text: Utils.capitalize(
                          AppLocalizations.translate('Ajouter encore')),
                    ),
                    BtnSuccessNext(
                      text: AppLocalizations.translate("Continuer"),
                      onTap: () => Get.to(() => const SelectOperatorPage()),
                    ),
                    BtnDanger(text: AppLocalizations.translate("Annuler"))
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
