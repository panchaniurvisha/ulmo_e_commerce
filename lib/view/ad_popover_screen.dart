import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/common/app_elevated_button.dart';
import 'package:ulmo_e_commerce_app/res/common/app_text.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_colors.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_images.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_string.dart';

class AdPoPoverScreen extends StatefulWidget {
  const AdPoPoverScreen({Key? key}) : super(key: key);

  @override
  State<AdPoPoverScreen> createState() => _AdPoPoverScreenState();
}

class _AdPoPoverScreenState extends State<AdPoPoverScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.lightBlack,
          body: Center(
            child: Container(
              height: height / 1.5,
              width: width / 1.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(height / 60),
                color: AppColors.skyWhite,
              ),
              child: Padding(
                padding: EdgeInsets.all(height / 50),
                child: Column(
                  children: [
                    Image.asset(
                      AppImages.bedRoomImage,
                    ),
                    SizedBox(
                      height: height / 40,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: width / 8),
                      child: AppText(
                        text: AppString.subscribeTitle,
                        fontWeight: FontWeight.w600,
                        fontSize: height / 30,
                      ),
                    ),
                    AppText(
                      text: AppString.usefulContent,
                      color: AppColors.gray,
                      fontSize: height / 50,
                    ),
                    SizedBox(
                      height: height / 40,
                    ),
                    const AppElevatedButton(
                      sizeBox: SizedBox(),
                      text: AppString.subscribe,
                    ),
                    SizedBox(
                      height: height / 50,
                    ),
                    const AppElevatedButton(
                      color: AppColors.white,
                      sizeBox: SizedBox(),
                      text: AppString.word,
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
