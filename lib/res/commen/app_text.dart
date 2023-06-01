import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_colors.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_string.dart';

class AppText extends StatelessWidget {
  final String? text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  const AppText(
      {Key? key,
      required this.text,
      this.color,
      this.fontWeight,
      this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Text(
      text!,
      style: TextStyle(
        color: color ?? AppColors.black,
        fontWeight: fontWeight ?? FontWeight.w400,
        fontFamily: AppString.appFontFamily,
        fontSize: fontSize ?? height / 50,
      ),
    );
  }
}
