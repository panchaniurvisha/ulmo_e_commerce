import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/common/app_elevated_button.dart';
import 'package:ulmo_e_commerce_app/res/common/app_text.dart';
import 'package:ulmo_e_commerce_app/res/common/row_app_bar.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_colors.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_images.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_string.dart';

import '../res/common/app_container.dart';

class NewReviewScreen extends StatefulWidget {
  const NewReviewScreen({Key? key}) : super(key: key);

  @override
  State<NewReviewScreen> createState() => _NewReviewScreenState();
}

class _NewReviewScreenState extends State<NewReviewScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(height / 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const RowAppBar(
                text: AppString.newReview,
                icon: Icon(Icons.close),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star,
                    color: AppColors.lightYellowTwo,
                    size: height / 20,
                  ),
                  Icon(
                    Icons.star,
                    color: AppColors.lightYellowTwo,
                    size: height / 20,
                  ),
                  Icon(
                    Icons.star,
                    color: AppColors.lightYellowTwo,
                    size: height / 20,
                  ),
                  Icon(
                    Icons.star,
                    color: AppColors.lightYellowTwo,
                    size: height / 20,
                  ),
                  Icon(
                    Icons.star_border,
                    color: AppColors.grayWhite,
                    size: height / 20,
                  ),
                ],
              ),
              Align(
                alignment: Alignment.center,
                heightFactor: height / 280,
                child: const AppText(
                  text: AppString.nice,
                  color: AppColors.gray,
                ),
              ),
              const AppContainer(
                appText: AppText(
                  text: AppString.reviewTitle,
                  color: AppColors.gray,
                ),
                appTextOne: AppText(
                  text: AppString.reviewOne,
                ),
                sizedBox: SizedBox(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: height / 30),
                child: Row(
                  children: [
                    Image.asset(
                      AppImages.cameraImageOne,
                      height: height / 10,
                    ),
                    SizedBox(
                      width: width / 20,
                    ),
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Image.asset(
                          AppImages.reviewOne,
                          height: height / 10,
                        ),
                        IconButton(
                            splashRadius: height / 30,
                            onPressed: () {},
                            icon: Image.asset(
                              AppImages.closeButton,
                              height: height / 40,
                            )),
                      ],
                    ),
                    SizedBox(
                      width: width / 20,
                    ),
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Image.asset(
                          AppImages.reviewTwo,
                          height: height / 10,
                        ),
                        IconButton(
                            splashRadius: height / 30,
                            onPressed: () {},
                            icon: Image.asset(
                              AppImages.closeButton,
                              height: height / 40,
                            )),
                      ],
                    )
                  ],
                ),
              ),
              const AppElevatedButton(
                  text: AppString.sendButton, sizeBox: SizedBox())
            ],
          ),
        ),
      ),
    );
  }
}
