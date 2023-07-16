import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_colors.dart';
import 'package:ulmo_e_commerce_app/utils/routes/routes_name.dart';

import '../res/common/app_elevated_button.dart';
import '../res/common/app_text.dart';
import '../res/constant/app_images.dart';
import '../res/constant/app_string.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.lightYellow,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width / 20),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: height / 3.5, bottom: height / 60),
              child: Image.asset(AppImages.successEmoji, height: height / 10),
            ),
            AppText(
                text: AppString.orderLabel,
                fontWeight: FontWeight.w600,
                fontSize: height / 40),
            const AppText(text: AppString.aboutOrder, color: AppColors.gray),
            SizedBox(
              height: height / 2.5,
            ),
            AppElevatedButton(
              text: AppString.successButton,
              sizeBox: const SizedBox(),
              onPressed: () =>
                  Navigator.pushNamed(context, RoutesName.myOrderScreen),
            )
          ],
        ),
      ),
    );
  }
}
