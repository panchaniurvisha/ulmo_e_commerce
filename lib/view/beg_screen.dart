import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/common/app_elevated_button.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_colors.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_images.dart';

import '../res/common/app_text.dart';
import '../res/constant/app_string.dart';

class BegScreen extends StatefulWidget {
  const BegScreen({Key? key}) : super(key: key);

  @override
  State<BegScreen> createState() => _BegScreenState();
}

class _BegScreenState extends State<BegScreen> {
  int itemCount = 0;
  int countItem = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: height / 20, horizontal: width / 40),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                    text: AppString.bag,
                    fontWeight: FontWeight.w600,
                    fontSize: height / 25),
                SizedBox(
                  height: height / 40,
                ),
                Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(width / 40),
                          topLeft: Radius.circular(width / 40),
                        ),
                        child: Image.asset(AppImages.bedSideTable,
                            height: height / 7)),
                    SizedBox(
                      width: width / 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            AppText(
                              text: AppString.price,
                              fontWeight: FontWeight.w500,
                              fontSize: height / 40,
                            ),
                            SizedBox(
                              width: width / 2.9,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.highlight_off,
                                color: AppColors.gray,
                              ),
                            ),
                          ],
                        ),
                        AppText(
                          text: AppString.aboutTable,
                          color: AppColors.gray,
                          fontSize: height / 55,
                        ),
                        SizedBox(
                          height: height / 100,
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: height / 60),
                          height: height / 25,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(width / 50),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      itemCount > 0 ? itemCount-- : null;
                                    });
                                  },
                                  padding: EdgeInsets.symmetric(
                                      vertical: height / 150),
                                  icon: const Icon(
                                    Icons.remove,
                                  )),
                              AppText(
                                  text: itemCount.toString(),
                                  fontWeight: FontWeight.w500),
                              IconButton(
                                  padding: EdgeInsets.symmetric(
                                      vertical: height / 150),
                                  onPressed: () {
                                    setState(() {
                                      itemCount < 15 ? itemCount++ : null;
                                    });
                                  },
                                  icon: const Icon(Icons.add))
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(width / 40),
                          topLeft: Radius.circular(width / 40),
                        ),
                        child: Image.asset(AppImages.squareTable,
                            height: height / 7)),
                    SizedBox(
                      width: width / 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            AppText(
                              text: AppString.dollarPrice,
                              fontWeight: FontWeight.w500,
                              fontSize: height / 40,
                            ),
                            SizedBox(
                              width: width / 3,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.highlight_off,
                                color: AppColors.gray,
                              ),
                            ),
                          ],
                        ),
                        AppText(
                          text: AppString.aboutBedSideTable,
                          color: AppColors.gray,
                          fontSize: height / 55,
                        ),
                        SizedBox(
                          height: height / 100,
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: height / 60),
                          height: height / 25,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(width / 50),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      countItem > 1 ? countItem-- : null;
                                    });
                                  },
                                  padding: EdgeInsets.symmetric(
                                      vertical: height / 150),
                                  icon: const Icon(
                                    Icons.remove,
                                  )),
                              AppText(
                                  text: countItem.toString(),
                                  fontWeight: FontWeight.w500),
                              IconButton(
                                  padding: EdgeInsets.symmetric(
                                      vertical: height / 150),
                                  onPressed: () {
                                    setState(() {
                                      countItem < 15 ? countItem++ : null;
                                    });
                                  },
                                  icon: const Icon(Icons.add))
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: height / 28),
                  child: AppText(
                    text: AppString.promoTitle,
                    fontWeight: FontWeight.w600,
                    fontSize: height / 30,
                  ),
                ),
                Container(
                  height: height / 15,
                  margin: EdgeInsets.only(bottom: height / 28),
                  padding: EdgeInsets.symmetric(horizontal: width / 20),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(width / 40)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(text: AppString.appName, fontSize: height / 40),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.highlight_off,
                          ))
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: AppString.total,
                      fontWeight: FontWeight.w600,
                      fontSize: height / 40,
                    ),
                    AppText(
                      text: AppString.fourHundredTwenty,
                      fontWeight: FontWeight.w600,
                      fontSize: height / 40,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    AppText(
                      text: AppString.promoTitle,
                      color: AppColors.gray,
                    ),
                    AppText(
                      text: AppString.twentyFive,
                      color: AppColors.gray,
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 28,
                ),
                const AppElevatedButton(
                  text: AppString.checkout,
                  sizeBox: SizedBox(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
