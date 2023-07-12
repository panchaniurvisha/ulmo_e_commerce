import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/common/app_text.dart';
import 'package:ulmo_e_commerce_app/res/common/search_bar.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_colors.dart';

import '../data/user_data_first_screen.dart';
import '../model/first_screen_model.dart';
import '../res/common/app_image_outline_button.dart';
import '../res/common/row_app_bar.dart';
import '../res/constant/app_images.dart';
import '../res/constant/app_string.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  FirstScreenModel? userModel = FirstScreenModel.fromJson(userData);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 28),
          child: Column(
            children: [
              const RowAppBar(
                text: AppString.myOrders,
              ),
              AppSearchBar(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppImageOutLineButton(
                      text: AppString.sortButton, image: AppImages.sortIcon),
                  AppImageOutLineButton(
                      text: AppString.filterButton,
                      image: AppImages.filterIcon),
                ],
              ),
              ListView.separated(
                itemCount: userModel!.order!.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          text: "${userModel!.order![index].time}",
                        ),
                        AppText(
                          text: "${userModel!.order![index].price},",
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                            text: "${userModel!.order![index].aboutTime}",
                            fontSize: height / 55,
                            color: index == 0
                                ? AppColors.gray
                                : AppColors.green400),
                        AppText(
                            text: "${userModel!.order![index].number}",
                            color: AppColors.gray,
                            fontSize: height / 55)
                      ],
                    ),
                    Row(
                      children: [Image.asset("${userModel}")],
                    )
                  ],
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: height / 10,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
