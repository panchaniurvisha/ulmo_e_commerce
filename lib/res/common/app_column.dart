import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_colors.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_string.dart';

class AppColumn extends StatelessWidget {
  final int? index;
  final String? text;
  final String? data;
  final String? information;
  final String? image;
  final Widget? iconButton;

  const AppColumn({
    Key? key,
    this.index,
    this.text,
    this.data,
    this.information,
    this.image,
    this.iconButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Stack(children: [
          Image.asset(image! //"${userModel.popularItem![index].popularImage}",
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
                      text!, //"${userModel.popularItem![index].recentlyNew}",
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
            Text(data!, //"${userModel.popularItem![index].price}",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: height / 45,
                  fontWeight: FontWeight.w500,
                  fontFamily: AppString.appFontFamily,
                  color: AppColors.black,
                )),
            iconButton!

            //"${userModel.popularItem![index].icon}",
          ],
        )
      ],
    );
  }
}
