import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/common/app_list_tile.dart';
import 'package:ulmo_e_commerce_app/res/common/app_rating_bar.dart';
import 'package:ulmo_e_commerce_app/res/common/app_text.dart';
import 'package:ulmo_e_commerce_app/res/common/row_app_bar.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_colors.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_string.dart';

import '../res/common/app_elevated_button.dart';
import '../res/constant/app_images.dart';

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
              Center(
                child: AppRatingBar(
                  size: height / 30,
                ),
              ),
              const AppListTile(
                titleText: AppString.reviewTitle,
                subTitleText: AppString.reviewOne,
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
              AppElevatedButton(
                text: AppString.sendButton,
                sizeBox: const SizedBox(),
                onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          width / 10,
                        ),
                      ),
                      child: Container(
                        height: height / 1.5,
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
                              AppElevatedButton(
                                  sizeBox: const SizedBox(),
                                  text: AppString.subscribe,
                                  onPressed: () => Navigator.pop(context)),
                              SizedBox(
                                height: height / 50,
                              ),
                              AppElevatedButton(
                                  color: AppColors.white,
                                  sizeBox: const SizedBox(),
                                  text: AppString.word,
                                  onPressed: () => Navigator.pop(context))
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
