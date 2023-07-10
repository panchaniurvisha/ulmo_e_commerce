import 'package:flutter/material.dart';

import '../constant/app_colors.dart';

class AppOutlineButton extends StatelessWidget {
  final String? text;
  final Color? color;
  const AppOutlineButton({Key? key, required this.text, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.lightYellowTwo)),
      child: Text(
        text!,
        style: TextStyle(color: AppColors.black),
      ),
      onPressed: () {},
    );
  }
}
