import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_infinite_marquee/flutter_infinite_marquee.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:t_gab/presentation/pages/insert_card/insert_card_screen.dart';
import 'package:t_gab/presentation/pages/operation/select_operation_screen.dart';
import 'package:t_gab/presentation/pages/qr_code/qr_code_scanner_screen.dart';
import '../../controllers/auth/auth_controller.dart';


class HomePage extends GetView<AuthController> {



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

              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image principale
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Center(
                        child: Container(
                          height: Get.height/1.5,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 10,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/images/atm.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Boutons de langue
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        _buildLanguageButton('Français', Colors.deepOrange),
                        SizedBox(height: 16),
                        _buildLanguageButton('English', Colors.deepOrange),
                      ],
                    ),
                  ),
                ],
              ),

              Spacer(),
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

Widget _buildLanguageButton(String text, Color color) {
  return InkWell(
    onTap: (){
      Get.to(()=>SelectOperationScreen());
    },
    child: Container(
      width: 250,
      height: 80,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 32,
                fontFamily: 'Roboto'
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
                color: color,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
