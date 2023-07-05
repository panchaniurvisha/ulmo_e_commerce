import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/common/app_elevated_button.dart';
import 'package:ulmo_e_commerce_app/res/common/app_text.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_string.dart';

import '../res/constant/app_colors.dart';
import '../res/constant/app_images.dart';

class EmptyBegScreen extends StatelessWidget {
  const EmptyBegScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: height / 20, horizontal: width / 20),
          child: Column(
            children: [
              AppText(
                  text: AppString.bag,
                  fontWeight: FontWeight.w600,
                  fontSize: height / 30),
              Padding(
                padding: EdgeInsets.only(top: height / 8, bottom: height / 25),
                child:
                    Image.asset(AppImages.emptyBegEmoji, height: height / 10),
              ),
              AppText(
                  text: AppString.bagLabel,
                  fontWeight: FontWeight.w600,
                  fontSize: height / 40),
              const AppText(text: AppString.aboutBag, color: AppColors.gray),
              SizedBox(
                height: height / 3.5,
              ),
              const AppElevatedButton(
                text: AppString.shopping,
                sizeBox: SizedBox(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
