import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/common/app_text.dart';

import '../constant/app_colors.dart';

class AppOutlineButton extends StatelessWidget {
  final String? text;
  final MaterialStateProperty<Color?>? color;
  const AppOutlineButton({
    Key? key,
    required this.text,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return OutlinedButton(
      style: ButtonStyle(
          backgroundColor:
              color ?? MaterialStateProperty.all(AppColors.lightYellowTwo)),
      child: AppText(
          text: text!, fontWeight: FontWeight.w500, fontSize: height / 60),
      onPressed: () {},
    );
  }
}
