import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/model/first_screen_model.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_colors.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_string.dart';

import '../../data/user_data_first_screen.dart';

class AppGridViewBuilder extends StatelessWidget {
  final int? itemCount;
  final Image? image;
  final Image? imageOne;
  final String? data;
  final String? text;
  const AppGridViewBuilder({
    Key? key,
    this.itemCount,
    this.image,
    this.text,
    this.imageOne,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirstScreenModel? userModel = FirstScreenModel.fromJson(userData);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: itemCount ?? userModel.popularItem!.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.50,
        mainAxisExtent: height / 2.9,
        crossAxisSpacing: width / 20,
      ),
      itemBuilder: (context, index) => Column(
        children: [
          Stack(children: [
            image ??
                Image.asset(
                  "${userModel.popularItem![index].popularImage}",
                ),
            index == 0
                ? Container(
                    margin: EdgeInsets.only(
                      top: height / 70,
                      left: width / 40,
                    ),
                    decoration: BoxDecoration(
                        color: AppColors.lightYellowTwo,
                        borderRadius: BorderRadius.circular(width / 100)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: height / 300, horizontal: width / 50),
                      child: Text(
                        "${userModel.popularItem![index].recentlyNew}",
                        style: TextStyle(
                          color: AppColors.black,
                          fontFamily: AppString.appFontFamily,
                          fontWeight: FontWeight.w500,
                          fontSize: height / 70,
                        ),
                      ),
                    ),
                  )
                : const SizedBox()
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text ?? "${userModel.popularItem![index].price}",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: height / 45,
                    fontWeight: FontWeight.w500,
                    fontFamily: AppString.appFontFamily,
                    color: AppColors.black,
                  )),
              imageOne ??
                  Image.asset(
                    "${userModel.popularItem![index].icon}",
                    height: height / 45,
                  )
            ],
          ),
          Text(data ?? "${userModel.popularItem![index].itemName}",
              style: TextStyle(
                fontSize: height / 70,
                fontWeight: FontWeight.w400,
                fontFamily: AppString.appFontFamily,
                color: AppColors.gray,
              )),
        ],
      ),
    );
  }
}
