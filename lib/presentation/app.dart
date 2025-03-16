import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_gab/app/config/app_colors.dart';
import 'package:t_gab/presentation/pages/home/main_page.dart';
import 'controllers/auth/auth_binding.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/",
      initialBinding: AuthBinding(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Gilroy',
          textTheme: TextTheme(
              titleLarge: TextStyle(
            color: AppColors.textBlue,
          ))),
      home: const MainPage(),
    );
  }
}
