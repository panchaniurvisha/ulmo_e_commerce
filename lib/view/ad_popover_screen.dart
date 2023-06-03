import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/commen/app_elevated_button.dart';
import 'package:ulmo_e_commerce_app/res/commen/app_text.dart';
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
          body: Container(
            decoration: const BoxDecoration(
              color: AppColors.skyWhite,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(height / 10),
                  child: Image.asset(
                    AppImages.bedRoomImage,
                  ),
                ),
                AppText(
                  text: AppString.subscribeTitle,
                  fontWeight: FontWeight.w600,
                  fontSize: height / 30,
                ),
                AppText(
                  text: AppString.usefulContent,
                  color: AppColors.gray,
                  fontWeight: FontWeight.w600,
                  fontSize: height / 50,
                ),
                const AppElevatedButton(
                  sizeBox: SizedBox(),
                  text: AppString.subscribe,
                ),
                const AppElevatedButton(
                  color: AppColors.,
                  sizeBox: SizedBox(),
                  text: AppString.word,

                ),
              ],
            ),
          )),
    );
  }
}
