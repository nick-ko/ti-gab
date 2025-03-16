import 'package:flutter/material.dart';
import 'package:t_gab/app/config/app_colors.dart';

class BtnTitle extends StatelessWidget {
  const BtnTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.orange,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // Adapter la largeur au contenu
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 32,
              fontFamily: 'Gilroy',
            ),
          ),
        ],
      ),
    );
  }
}
