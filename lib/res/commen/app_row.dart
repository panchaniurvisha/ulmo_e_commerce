import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/commen/app_text.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_colors.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_string.dart';

class AppRow extends StatelessWidget {
  const AppRow({Key? key}) : super(key: key);

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
        Icon(
          Icons.star,
          color: AppColors.lightYellowTwo,
          size: height / 50,
        ),
        Icon(
          Icons.star,
          color: AppColors.grayWhite,
          size: height / 50,
        ),
        SizedBox(
          width: width / 2.8,
        ),
        AppText(
          text: AppString.time,
          color: AppColors.gray,
          fontSize: height / 60,
        )
      ],
    );
  }
}
