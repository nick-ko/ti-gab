import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:t_gab/presentation/components/infobar/info_bar.dart';
import 'package:t_gab/presentation/components/topbar/topbar.dart';

class Background1 extends StatelessWidget {
  const Background1({
    super.key,
    required this.child,
  });
  final Widget child; // Contenu spécifique à chaque page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Image de fond
          Positioned.fill(
            child: Image.asset(
              "assets/images/bg-globe.jpg",
              fit: BoxFit.cover,
            ),
          ),

          // Overlay blanc semi-transparent
          Positioned.fill(
            child: Container(
              color: Colors.white.withOpacity(0.8), // Opacité de 70%
            ),
          ),

          // Contenu spécifique à chaque page
          Column(
            children: [
              // Barre d'app bar personnalisée
              TopBar(),

              // Contenu de la page
              Expanded(child: child),
              //Flash info
              InfoBar()
            ],
          ),
        ],
      ),
    );
  }
}
