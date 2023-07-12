import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/common/app_image_outline_button.dart';
import 'package:ulmo_e_commerce_app/res/common/app_outline_button.dart';
import 'package:ulmo_e_commerce_app/res/common/search_bar.dart';

import '../res/common/app_text.dart';
import '../res/constant/app_colors.dart';
import '../res/constant/app_images.dart';
import '../res/constant/app_string.dart';

class SavedItemsScreen extends StatefulWidget {
  const SavedItemsScreen({super.key});

  @override
  State<SavedItemsScreen> createState() => _SavedItemsScreenState();
}

class _SavedItemsScreenState extends State<SavedItemsScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: width / 30, vertical: height / 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
                text: AppString.savedItems,
                fontWeight: FontWeight.w600,
                fontSize: height / 30),
            const AppSearchBar(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppImageOutLineButton(
                    text: AppString.sortButton, image: AppImages.sortIcon),
                AppImageOutLineButton(
                    text: AppString.filterButton, image: AppImages.filterIcon)
              ],
            ),
            Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(width / 40)),
                    child: Image.asset(AppImages.bedSideTable,
                        height: height / 7)),
                SizedBox(
                  width: width / 30,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: height / 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const AppText(
                              text: AppString.price,
                              fontWeight: FontWeight.w500,
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
                        const AppOutlineButton(
                          text: AppString.moveToBag,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(width / 40)),
                    child:
                        Image.asset(AppImages.squareTable, height: height / 7)),
                SizedBox(
                  width: width / 30,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: height / 70),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const AppText(
                              text: AppString.dollarPrice,
                              fontWeight: FontWeight.w500,
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
                        AppOutlineButton(
                          text: AppString.moveToBag,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
