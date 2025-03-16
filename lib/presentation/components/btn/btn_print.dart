import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:t_gab/app/config/app_colors.dart';

class BtnPrint extends StatelessWidget {
  const BtnPrint({super.key, this.onTap, required this.text});

  final void Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 250,
        height: 80,
        decoration: BoxDecoration(
          color: AppColors.lightGraybtn,
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
                    color: AppColors.textBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    fontFamily: 'Roboto'),
              ),
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  CupertinoIcons.printer_fill,
                  color: AppColors.textBlue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
