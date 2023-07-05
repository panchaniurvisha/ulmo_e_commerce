import 'package:flutter/material.dart';

import '../res/common/app_elevated_button.dart';
import '../res/common/app_text.dart';
import '../res/constant/app_colors.dart';
import '../res/constant/app_images.dart';
import '../res/constant/app_string.dart';

class SavedItemsEmptyScreen extends StatefulWidget {
  const SavedItemsEmptyScreen({super.key});

  @override
  State<SavedItemsEmptyScreen> createState() => _SavedItemsEmptyScreenState();
}

class _SavedItemsEmptyScreenState extends State<SavedItemsEmptyScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width / 20, vertical: height / 20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: AppText(
                    text: AppString.savedItems,
                    fontWeight: FontWeight.w600,
                    fontSize: height / 25),
              ),
              Padding(
                padding: EdgeInsets.only(top: height / 8, bottom: height / 25),
                child: Image.asset(AppImages.nothingSavedEmoji,
                    height: height / 10),
              ),
              AppText(
                  text: AppString.nothingSave,
                  fontWeight: FontWeight.w600,
                  fontSize: height / 40),
              const AppText(text: AppString.startSaving, color: AppColors.gray),
              const AppText(
                  text: AppString.clickLittleText, color: AppColors.gray),
              SizedBox(
                height: height / 3.5,
              ),
              const AppElevatedButton(
                text: AppString.startShoppingButton,
                sizeBox: SizedBox(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
