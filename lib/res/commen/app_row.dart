import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/commen/app_text.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_colors.dart';

class AppRow extends StatelessWidget {
  final String? text;
  final Icon? icon;
  final Icon? iconOne;
  const AppRow({
    Key? key,
    this.text,
    this.icon,
    this.iconOne,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Icon(
          Icons.star,
          color: AppColors.lightYellowTwo,
          size: height / 50,
        ),
        Icon(
          Icons.star,
          color: AppColors.lightYellowTwo,
          size: height / 50,
        ),
        Icon(
          Icons.star,
          color: AppColors.lightYellowTwo,
          size: height / 50,
        ),
        icon ??
            Icon(
              Icons.star,
              color: AppColors.lightYellowTwo,
              size: height / 50,
            ),
        iconOne ??
            Icon(
              Icons.star_border,
              color: AppColors.grayWhite,
              size: height / 50,
            ),
        Spacer(),
        AppText(
          text: text!,
          color: AppColors.gray,
          fontSize: height / 60,
        )
      ],
    );
  }
}
