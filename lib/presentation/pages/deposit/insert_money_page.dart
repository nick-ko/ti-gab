import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:t_gab/app/config/app_colors.dart';
import 'package:t_gab/app/util/lang/tralsation.dart';
import 'package:t_gab/app/util/util.dart';
import 'package:t_gab/presentation/components/background/background1.dart';
import 'package:t_gab/presentation/components/btn/btn_title.dart';
import 'package:t_gab/presentation/pages/deposit/sum_deposit_page.dart';

class InserMoneyPage extends StatelessWidget {
  const InserMoneyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Background1(
        child: Column(
      children: [
        //TItire
        BtnTitle(title: Utils.capitalize(AppLocalizations.translate('dépôt'))),
        //Libelle
        Container(
          height: 150,
          width: 700,
          child: Column(
            children: [
              Utils.textTranslation(
                  'Veuillez insérer les billets dans le bocal à billets'),
            ],
          ),
        ),
        //Flex d'indication
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 90),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Left
              GestureDetector(
                onTap: () => Get.to(() => const SumDepositPage()),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Transform.scale(
                        scaleX: -1,
                        child: SizedBox(
                            width: 200,
                            height: 200,
                            child: Image.asset(
                                'assets/images/curve-down-arrow.png'))),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 150,
                          height: 20,
                          decoration: BoxDecoration(
                              color: AppColors.textBlue,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  width: 4, color: AppColors.orange)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 100,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              //RIGHT
              Column(
                children: [
                  Text(
                    "5 secondes restantes...",
                    style: TextStyle(color: AppColors.orange, fontSize: 35),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    width: 270,
                    height: 70,
                    decoration: BoxDecoration(
                        color: AppColors.danger,
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text(
                        Utils.capitalize(AppLocalizations.translate(
                            "Vous ne pouvez que 40 billets maximum")),
                        style: const TextStyle(
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontSize: 23),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    ));
  }
}
