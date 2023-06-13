import 'package:flutter/material.dart';

import '../constant/app_colors.dart';

class CheckBoxButton extends StatelessWidget {
  final void Function(void Function() ?
}
  const CheckBoxButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          value = !value;
        });
      },
      splashFactory: NoSplash.splashFactory,
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.lightYellowTwo,
        ),
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: value
              ? const Icon(
            Icons.check,
            size: 20.0,
            color: AppColors.black,
          )
              : const Icon(
            Icons.radio_button_unchecked,
            size: 20.0,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }

