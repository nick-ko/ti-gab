import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:t_gab/app/config/app_colors.dart';

class BtnOperation extends StatelessWidget {
  const BtnOperation({
    super.key,
    this.onTap,
    required this.text,
  });
  final void Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 80,
        decoration: BoxDecoration(
          color: AppColors.orange,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min, // Adapter la largeur au contenu
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 32,
                fontFamily: 'Gilroy',
              ),
            ),
            const SizedBox(width: 16), // Espacement entre le texte et l'icône
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.arrow_forward,
                color: AppColors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
