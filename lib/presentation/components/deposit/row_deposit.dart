import 'package:flutter/material.dart';
import 'package:t_gab/app/config/app_colors.dart';

class RowDeposit extends StatelessWidget {
  const RowDeposit({super.key, required this.montant});
  final String montant;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
        color: AppColors.textBlue,
      ),
      child: Center(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            montant,
            style: const TextStyle(
                fontSize: 30, fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
