import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_colors.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_string.dart';

import '../../utils/routes/routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState

    Timer(const Duration(seconds: 5), () {
      if (FirebaseAuth.instance.currentUser != null) {
        Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.bottomScreen, (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.loginScreen, (route) => false);
      }
    });
    super.initState();
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
