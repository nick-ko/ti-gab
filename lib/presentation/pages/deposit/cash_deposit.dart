import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_infinite_marquee/flutter_infinite_marquee.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:t_gab/presentation/pages/deposit/cash_deposit_solde.dart';
import 'package:t_gab/presentation/pages/insert_card/insert_card_screen.dart';
import 'package:t_gab/presentation/pages/operation/select_operation_screen.dart';
import 'package:t_gab/presentation/pages/qr_code/qr_code_scanner_screen.dart';
import '../../controllers/auth/auth_controller.dart';

class CashDepositScreen extends GetView<AuthController> {
  int _secondsRemaining = 5;
  late Timer _timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/bg.jpg'),
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
              // Header with logo and date
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/tinitz-logo.png',
                      height: 40,
                    ),
                    const Text(
                      'Ven. 10 Mars 2025 08:00',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // Dépôt button
              Container(
                width: 300,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFFE85C33),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Dépôt',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 42,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 60),

              // Main instruction
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: Text(
                  'Veuillez insérer les billets\ndans le bocal à billets',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A2748),
                  ),
                ),
              ),

              const Spacer(),

              // Countdown and note
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '$_secondsRemaining secondes restantes...',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                          color: Color(0xFFE85C33),
                        ),
                      ),
                      const SizedBox(height: 16),
                      InkWell(
                        onTap: () {
                          Get.to(() => CashDepositSolde());
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          color: const Color(0xFFC13121),
                          child: const Text(
                            'Vous ne pouvez déposer que 40 billets\nmaximum',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 60),

              const Spacer(),

              // Footer info bar
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
