// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:t_gab/app/config/app_colors.dart';

class NumTouch extends StatelessWidget {
  const NumTouch({
    Key? key,
    required this.num,
    this.color,
  }) : super(key: key);
  final String num;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color != null ? color : AppColors.textBlue,
          border: Border.all(width: 1, color: AppColors.orange)),
      child: Center(
        child: Text(
          num,
          style: const TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
