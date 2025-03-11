import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/auth/auth_binding.dart';
import 'pages/home/home_page.dart';
import 'pages/otp/otp_screen.dart';
import 'pages/withdrawal/withdrawal_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetCupertinoApp(
      initialRoute: "/",
      initialBinding: AuthBinding(),
      debugShowCheckedModeBanner: false,
      theme: const CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(
            fontFamily: 'Roboto',
          )
        )
      ),
      home: HomePage(),
    );
  }
}
