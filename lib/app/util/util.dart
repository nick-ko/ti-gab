import 'package:flutter/material.dart';
import 'package:t_gab/app/config/app_colors.dart';
import 'package:t_gab/app/util/lang/tralsation.dart';

class Utils {
  static String getImagePath(String name, {String format = 'png'}) {
    return 'assets/images/$name.$format';
  }

  // Fonction pour mettre la première lettre en majuscule
  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  static Widget textTranslation(
    String text,
  ) {
    return Text(
      capitalize(AppLocalizations.translate(text)),
      style: TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.w700,
          color: AppColors.textBlue,
          fontFamily: "Gilroy"),
      textAlign: TextAlign.center,
    );
  }
}
