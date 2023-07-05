import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_colors.dart';

class CheckBoxButton extends StatelessWidget {
  final void Function()? onTap;
  final bool? value;
  const CheckBoxButton({super.key, this.onTap, this.value});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap!,
      splashFactory: NoSplash.splashFactory,
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: value! ? AppColors.lightYellowTwo : AppColors.grayWhite),
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: value!
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
}
