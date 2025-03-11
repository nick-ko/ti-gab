import 'package:flutter/material.dart';
import 'package:flutter_infinite_marquee/flutter_infinite_marquee.dart';
import 'package:get/get.dart';
import 'package:t_gab/presentation/pages/deposit/cash_deposit_operator.dart';

import '../../controllers/auth/auth_controller.dart';
import '../deposit/cash_deposit.dart';

class SelectOperationScreen extends GetView<AuthController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.5),
              BlendMode.lighten,
            ),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // En-tête avec logo et date
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Logo Tinitz
                    Image.asset(
                      'assets/images/tinitz-logo.png',
                      height: 40,
                    ),
                    // Date
                    Text(
                      'Ven. 10 Mars 2025 08:00',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'Roboto'
                      ),
                    ),
                  ],
                ),
              ),

              // Titre et options d'opération
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Titre
                      Text(
                        'Quelle opération souhaitez-vous effectuer ?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0E1B40), // Bleu foncé
                          fontFamily: 'Roboto'
                        ),
                      ),
                      SizedBox(height: 60),

                      // Boutons d'opération
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildOperationButton('Dépôt', context),
                          _buildOperationButton('Retrait', context),
                        ],
                      ),
                    ],
                  ),
                ),
              ),


              // Barre d'infos en bas
              Row(
                children: [
                  Container(
                    height: 50,
                    color: Colors.deepOrange,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Infos',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            fontFamily: 'Roboto'
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      color: Colors.white,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InfiniteMarquee(
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                children: [
                                  Text(
                                    'Bienvenue à votre TiGAB.',
                                    style: TextStyle(
                                      color: Colors.indigo[900],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(width: 10,)
                                ],
                              );
                            },
                          )
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildOperationButton(String text, BuildContext context) {
  return InkWell(
    onTap: (){
      Get.to(()=>CashDepositScreen());
    },
    child: Container(
      width: Get.width * 0.43, // ~40% de la largeur de l'écran
      height: 100,
      decoration: BoxDecoration(
        color: Colors.deepOrange,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                fontSize: 32,
              ),
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.arrow_forward,
                color: Colors.deepOrange,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

