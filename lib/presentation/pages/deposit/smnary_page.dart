import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:t_gab/app/util/lang/tralsation.dart';
import 'package:t_gab/app/util/util.dart';
import 'package:t_gab/presentation/components/background/background1.dart';
import 'package:t_gab/presentation/components/btn/btn_back.dart';
import 'package:t_gab/presentation/components/btn/btn_danger.dart';
import 'package:t_gab/presentation/components/btn/btn_logo.dart';
import 'package:t_gab/presentation/components/btn/btn_success_confirmation.dart';
import 'package:t_gab/presentation/components/btn/btn_title.dart';
import 'package:t_gab/presentation/components/deposit/row_deposit.dart';
import 'package:t_gab/presentation/pages/withdrawal/result_of_operation_page_w.dart';

class SummnaryPage extends StatelessWidget {
  const SummnaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Background1(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          //titre
          BtnTitle(
              title: Utils.capitalize(AppLocalizations.translate('dépôt'))),
          const SizedBox(
            height: 20,
          ),
          //Moyen de paiement
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Utils.textTranslation('Envoyer sur'),
              const SizedBox(
                width: 15,
              ),
              BtnLogo(assetPath: 'assets/images/om.png')
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          //Montant a retirer
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Utils.textTranslation('Montant:650.000 XOF'),
            ],
          ),

          //Info comte
          const RowDeposit(
            montant: 'Nom : Jean Cedric',
          ),
          const SizedBox(
            height: 10,
          ),
          const RowDeposit(
            montant: 'Numéro : +225 0102030405',
          ),

          const SizedBox(
            height: 30,
          ),

          //Btn menu
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BtnSuccessConfirmation(
                  onTap: () => Get.to(() => ResultOfOperationW(
                      isSuccess: true,
                      message: AppLocalizations.translate(
                          'Dépôt effectué avec succès'))),
                  text: AppLocalizations.translate('Confirmation')),
              BtnBack(
                text: AppLocalizations.translate('Retour'),
                onTap: () => Get.back(),
              ),
              BtnDanger(
                text: AppLocalizations.translate('Annuler'),
                onTap: () => Get.to(() => ResultOfOperationW(
                    isSuccess: false,
                    message: AppLocalizations.translate(
                        'Impossible d’effectuer le dépôt'))),
              )
            ],
          )
        ],
      ),
    ));
  }
}
