import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/common/app_text.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_colors.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_images.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_string.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen({Key? key}) : super(key: key);

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              AppImages.storyImage,
            ),
            Positioned(
              left: width / 1.2,
              top: height / 15,
              child: Container(
                decoration: const BoxDecoration(
                    color: AppColors.skyWhite, shape: BoxShape.circle),
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close, size: height / 30),
                ),
              ),
            ),
            Positioned(
              top: height / 1.5,
              left: width / 20,
              child: AppText(
                text: AppString.jar,
                color: AppColors.skyWhite,
                fontSize: height / 28,
                fontWeight: FontWeight.w600,
              ),
            ),
            Positioned(
              top: height / 1.3,
              left: width / 20,
              child: AppText(
                text: AppString.aboutJar,
                color: AppColors.skyWhite,
                fontSize: height / 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
