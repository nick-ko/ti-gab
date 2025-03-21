import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:t_gab/app/config/app_colors.dart';
import 'package:t_gab/app/util/lang/tralsation.dart';
import 'package:t_gab/app/util/util.dart';
import 'package:t_gab/presentation/components/background/background1.dart';
import 'package:t_gab/presentation/components/btn/btn_title.dart';
import 'package:t_gab/presentation/components/keyboard/customkeyboard.dart';
import 'package:t_gab/presentation/components/keyboard/num_touch.dart';
import 'package:t_gab/presentation/pages/withdrawal/summary_page_w.dart';

class QrcodeScannerPageW extends StatefulWidget {
  const QrcodeScannerPageW({super.key});

  @override
  State<QrcodeScannerPageW> createState() => _QrcodeScannerPageWState();
}

class _QrcodeScannerPageWState extends State<QrcodeScannerPageW> {
  final _controller = TextEditingController();

  void _onKeyTap(String value) {
    setState(() {
      _controller.text += value;
    });
  }

  void _onDelete() {
    setState(() {
      if (_controller.text.isNotEmpty) {
        _controller.text =
            _controller.text.substring(0, _controller.text.length - 1);
      }
    });
  }

  Widget _buildKey(String value) {
    return GestureDetector(
      onTap: () => _onKeyTap(value),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          value,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    log("NUM ${_controller.text}");
    return Background1(
        child: Column(
      children: [
        //titre
        BtnTitle(
            title: Utils.capitalize(AppLocalizations.translate('retrait'))),
        const SizedBox(
          height: 20,
        ),

        Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Instruction et total
              Column(
                children: [
                  Utils.textTranslation("Total: 650.000 XOF"),
                  Container(
                      padding: const EdgeInsets.all(5),
                      width: 340,
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
                  GestureDetector(
                    onTap: () => Get.to(() => const SummnaryPageW()),
                    child: Flex(
                      direction: Axis.vertical,
                      children: [
                        Container(
                            padding: const EdgeInsets.all(5),
                            width: 340,
                            height: 240,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadiusDirectional.circular(15),
                                color: Colors.white,
                                border: Border.all(
                                    color: AppColors.orange, width: 1)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset(
                                  "assets/images/qr-code.png",
                                  width: 130,
                                  height: 130,
                                ),
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
                  ),

                  //Clavier
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 340,
                    height: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Center(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 2),
                            color: AppColors.textBlue,
                            width: 340,
                            height: 40,
                            child: TextField(
                              maxLines: 1,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              controller: _controller,
                              readOnly:
                                  true, // Empêche le clavier natif de s'afficher
                              decoration: InputDecoration(
                                hintStyle: TextStyle(color: Colors.white),
                                focusColor: Colors.white,
                                labelStyle: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _controller.text += '1';
                                  print("NUM 1 ${_controller.text}");
                                });
                              },
                              child: const NumTouch(
                                num: '1',
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _controller.text += '2';
                                });
                              },
                              child: const NumTouch(
                                num: '2',
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _controller.text += '3';
                                });
                              },
                              child: const NumTouch(
                                num: '3',
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _controller.text += '4';
                                });
                              },
                              child: const NumTouch(
                                num: '4',
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _controller.text += '5';
                                });
                              },
                              child: const NumTouch(
                                num: '5',
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _controller.text += '6';
                                });
                              },
                              child: const NumTouch(
                                num: '6',
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _controller.text += '7';
                                });
                              },
                              child: const NumTouch(
                                num: '7',
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _controller.text += '8';
                                });
                              },
                              child: const NumTouch(
                                num: '8',
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _controller.text += '9';
                                });
                              },
                              child: const NumTouch(
                                num: '9',
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _controller.text += '*';
                                });
                              },
                              child: const NumTouch(
                                num: '*',
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _controller.text += '0';
                                });
                              },
                              child: const NumTouch(
                                num: '0',
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _controller.text += '#';
                                });
                              },
                              child: const NumTouch(
                                num: '#',
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: InkWell(
                                    onTap: _onDelete,
                                    child: NumTouch(
                                      num: 'Supp',
                                      color: AppColors.danger,
                                    )))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
