import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_colors.dart';

class Utils {
  bool isValidName(String name) {
    RegExp regExp = RegExp(r"^[a-zA-Z]{3,}");
    return regExp.hasMatch(name);
  }

  bool isValidPassword(String contact) {
    RegExp regExp = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
    return regExp.hasMatch(contact);
  }

  bool isValidMobile(String number) {
    RegExp regExp = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
    return regExp.hasMatch(number);
  }

  bool isValidEmail(String email) {
    RegExp regExp = RegExp(r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    return regExp.hasMatch(email);
  }

  void showSnackBar(
    BuildContext context, {
    String? message,
    String? label,
    SizedBox? sizeBox,
    EdgeInsetsGeometry? margin,
    void Function()? onPressed, //optional parameter
  }) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      margin: margin!,
      content: Row(
        children: [
          const CircularProgressIndicator(),
          sizeBox!,
          Text(message ?? ""),
        ],
      ),
      backgroundColor: Colors.black,
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(label: label ?? "", onPressed: onPressed ?? () {}, textColor: AppColors.lightYellowTwo),
    ));
  }
}
