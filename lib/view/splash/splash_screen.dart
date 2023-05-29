import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_colors.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_string.dart';
import 'package:ulmo_e_commerce_app/view/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      const Duration(seconds: 5),
      () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      color: AppColors.lightYellow,
      child: Center(
        child: Text(
          AppString.appName,
          style: TextStyle(
              decoration: TextDecoration.none,
              color: AppColors.black,
              fontWeight: FontWeight.w600,
              fontFamily: "Poppins",
              fontSize: height / 20),
        ),
      ),
    );
  }
}
