import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_infinite_marquee/flutter_infinite_marquee.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:t_gab/presentation/pages/insert_card/insert_card_screen.dart';
import 'package:t_gab/presentation/pages/operation/select_operation_screen.dart';
import 'package:t_gab/presentation/pages/otp/otp_screen.dart';
import 'package:t_gab/presentation/pages/qr_code/qr_code_scanner_screen.dart';
import 'package:t_gab/presentation/pages/withdrawal/withdrawal_screen.dart';
import '../../controllers/auth/auth_controller.dart';

class CashDepositOperator extends GetView<AuthController> {
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
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 16),

                      // Titre Dépôt
                      Container(
                        width: 200,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            'Dépôt',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: 36,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 16),

                      // Message
                      Text(
                        'Message...',
                        style: TextStyle(
                          fontSize: 28,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0E1B40), // Bleu foncé
                        ),
                      ),

                      SizedBox(height: 16),

                      // Boutons de montant
                      _buildAmountButton('250.000 XOF'),
                      SizedBox(height: 10),
                      _buildAmountButton('400.000 XOF'),

                      SizedBox(height: 40),

                      // Texte sélectionnez votre opérateur
                      Text(
                        'Sélectionnez votre opérateur',
                        style: TextStyle(
                          fontSize: 32,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0E1B40), // Bleu foncé
                        ),
                      ),

                      SizedBox(height: 30),

                      // Logos des opérateurs
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildOperatorLogo('assets/images/djamo.png'),
                          _buildOperatorLogo('assets/images/wave.webp'),
                          _buildOperatorLogo('assets/images/moov.png'),
                          _buildOperatorLogo('assets/images/om.png'),
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
                            fontFamily: 'Roboto'),
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
                                  Container(
                                    width: 10,
                                  )
                                ],
                              );
                            },
                          )),
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

Widget _buildAmountButton(String amount) {
  return Container(
    width: double.infinity,
    height: 60,
    decoration: BoxDecoration(
      color: Color(0xFF0E1B40), // Bleu foncé
      borderRadius: BorderRadius.circular(4),
    ),
    child: Center(
      child: Text(
        amount,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
    ),
  );
}

Widget _buildOperatorLogo(String assetPath) {
  return InkWell(
    onTap: () {
      Get.to(() => WithdrawalScreen());
    },
    child: Container(
      width: Get.height / 7,
      height: Get.height / 7,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage(assetPath),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}
