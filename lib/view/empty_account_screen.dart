import 'package:flutter/material.dart';

import '../res/common/app_elevated_button.dart';
import '../res/common/app_text.dart';
import '../res/constant/app_colors.dart';
import '../res/constant/app_images.dart';
import '../res/constant/app_string.dart';

class EmptyAccountScreen extends StatefulWidget {
  const EmptyAccountScreen({super.key});

  @override
  State<EmptyAccountScreen> createState() => _EmptyAccountScreenState();
}

class _EmptyAccountScreenState extends State<EmptyAccountScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width / 20, vertical: height / 40),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.settings_outlined,
                      color: AppColors.black,
                    )),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: AppText(
                    text: AppString.myAccount,
                    fontWeight: FontWeight.w600,
                    fontSize: height / 25),
              ),
              Padding(
                padding: EdgeInsets.only(top: height / 8, bottom: height / 25),
                child: Image.asset(AppImages.emptyAccountEmoji,
                    height: height / 10),
              ),
              AppText(
                  text: AppString.centreText,
                  fontWeight: FontWeight.w600,
                  fontSize: height / 40),
              const AppText(text: AppString.viewOrders, color: AppColors.gray),
              SizedBox(
                height: height / 3.5,
              ),
              const AppElevatedButton(
                text: AppString.phoneButton,
                sizeBox: SizedBox(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
