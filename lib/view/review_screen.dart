import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/commen/app_row.dart';
import 'package:ulmo_e_commerce_app/res/commen/app_text.dart';
import 'package:ulmo_e_commerce_app/res/commen/search_bar.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_colors.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_images.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_string.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width / 30, vertical: height / 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    padding: EdgeInsets.only(right: width / 10),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                    ),
                  ),
                  const AppText(
                      text: AppString.reviewText, fontWeight: FontWeight.w500),
                  const AppText(
                      text: AppString.newReview, fontWeight: FontWeight.w500),
                ],
              ),
              const AppSearchBar(),
              Padding(
                padding: EdgeInsets.only(bottom: height / 50),
                child: const AppRow(
                  text: AppString.time,
                ),
              ),
              Row(
                children: [
                  Image.asset(
                    AppImages.personOne,
                    height: height / 20,
                  ),
                  const AppText(
                    text: AppString.personOne,
                    fontWeight: FontWeight.w500,
                  )
                ],
              ),
              const AppText(
                text: AppString.reviewOne,
                color: AppColors.gray,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: height / 50),
                child: Row(
                  children: [
                    Image.asset(AppImages.reviewOne, height: height / 12),
                    SizedBox(
                      width: width / 30,
                    ),
                    Image.asset(AppImages.reviewTwo, height: height / 12),
                    SizedBox(
                      width: width / 30,
                    ),
                    Image.asset(AppImages.reviewThree, height: height / 12),
                  ],
                ),
              ),
              AppRow(
                icon: Icon(
                  Icons.star_border_outlined,
                  color: AppColors.grayWhite,
                  size: height / 50,
                ),
                text: AppString.timeSecond,
              ),
              Padding(
                padding: EdgeInsets.only(top: height / 40),
                child: Row(
                  children: [
                    Image.asset(
                      AppImages.personTwo,
                      height: height / 20,
                    ),
                    const AppText(
                      text: AppString.personTwo,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                ),
              ),
              const AppText(
                text: AppString.reviewTwo,
                color: AppColors.gray,
              ),
              Padding(
                padding: EdgeInsets.only(top: height / 50, bottom: height / 60),
                child: AppRow(
                    text: AppString.timeThird,
                    iconOne: Icon(
                      Icons.star,
                      color: AppColors.lightYellowTwo,
                      size: height / 50,
                    )),
              ),
              Row(
                children: [
                  Image.asset(
                    AppImages.personThree,
                    height: height / 20,
                  ),
                  const AppText(
                    text: AppString.personThree,
                    fontWeight: FontWeight.w500,
                  )
                ],
              ),
              const AppText(
                text: AppString.reviewThree,
                color: AppColors.gray,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
