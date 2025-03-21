import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_gab/app/util/lang/tralsation.dart';
import 'package:t_gab/app/util/util.dart';
import 'package:t_gab/presentation/components/background/background1.dart';
import 'package:t_gab/presentation/components/btn/btn_operation.dart';
import 'package:t_gab/presentation/pages/deposit/insert_money_page.dart';
import 'package:t_gab/presentation/pages/withdrawal/select_operator_w.dart';

class OperationChoicePage extends StatelessWidget {
  const OperationChoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Background1(
      child: Center(
        child: Container(
          height: 300,
          width: 700,
          child: Column(
            children: [
              Text(
                AppLocalizations.translate(
                    "Quelle opération souhaitez-vous effectuer ?"),
                style:
                    const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BtnOperation(
                      onTap: () => Get.to(() => const InserMoneyPage()),
                      text: Utils.capitalize(
                          AppLocalizations.translate('dépôt'))),
                  BtnOperation(
                      onTap: () => Get.to(() => const SelectOperatorPageW()),
                      text: Utils.capitalize(
                          AppLocalizations.translate("retrait"))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
