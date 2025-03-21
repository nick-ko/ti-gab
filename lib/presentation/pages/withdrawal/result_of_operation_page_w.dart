import 'package:flutter/material.dart';
import 'package:t_gab/app/config/app_colors.dart';
import 'package:t_gab/app/util/lang/tralsation.dart';
import 'package:t_gab/app/util/util.dart';
import 'package:t_gab/presentation/components/background/background1.dart';
import 'package:t_gab/presentation/components/btn/btn_danger.dart';
import 'package:t_gab/presentation/components/btn/btn_operation.dart';
import 'package:t_gab/presentation/components/btn/btn_print.dart';
import 'package:t_gab/presentation/components/btn/btn_try.dart';

class ResultOfOperationW extends StatelessWidget {
  const ResultOfOperationW(
      {super.key, required this.isSuccess, required this.message});
  final bool isSuccess;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Background1(
        child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          //Message et Icon
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Image.asset(
                    'assets/images/${isSuccess ? 'success.png' : 'error.png'}',
                    width: 150,
                    height: 150,
                  ),
                  Text(
                    message,
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w700,
                        color: isSuccess ? Colors.green : AppColors.danger,
                        fontFamily: "Gilroy"),
                    textAlign: TextAlign.center,
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          //Details
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Utils.textTranslation('Montant: '),
                        Utils.textTranslation('650.000 XOF'),
                      ],
                    ),
                    Row(
                      children: [
                        Utils.textTranslation('Nom: '),
                        Utils.textTranslation('Jean Cedric'),
                      ],
                    ),
                    Row(
                      children: [
                        Utils.textTranslation('Numéro: '),
                        Utils.textTranslation('+225 0102030405'),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          //Btn menu
          Visibility(
            visible: isSuccess,
            replacement: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BtnTry(text: AppLocalizations.translate('Réessayer')),
                BtnDanger(text: AppLocalizations.translate('Annuler')),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BtnPrint(text: AppLocalizations.translate('Imprimer')),
                BtnOperation(text: AppLocalizations.translate('Terminer'))
              ],
            ),
          )
        ],
      ),
    ));
  }
}
