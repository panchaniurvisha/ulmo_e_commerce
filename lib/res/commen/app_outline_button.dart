import 'package:flutter/material.dart';

import '../constant/app_colors.dart';

class AppOutlineButton extends StatelessWidget {
  final String? text;
  const AppOutlineButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: Text(
        text!,
        style: const TextStyle(color: AppColors.black),
      ),
      onPressed: () {},
    );
  }
}
