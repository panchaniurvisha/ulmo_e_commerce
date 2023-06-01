import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_colors.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_string.dart';

class AppContainer extends StatelessWidget {
  final String? text;
  final String? data;
  final String? name;
  final Padding? padding;

  const AppContainer({
    Key? key,
    this.text,
    this.data,
    this.name,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          color: AppColors.skyWhite,
          borderRadius: BorderRadius.circular(width / 60)),
      child: Row(
        children: [
          padding ?? SizedBox(),
          Padding(
            padding: EdgeInsets.all(height / 70),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text!, //AppString.text,
                  style: TextStyle(
                    color: AppColors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: height / 60,
                    fontFamily: AppString.appFontFamily,
                  ),
                ),
                Text(
                  data!, //AppString.help,
                  style: TextStyle(
                    color: AppColors.gray,
                    fontWeight: FontWeight.w400,
                    fontSize: height / 70,
                    fontFamily: AppString.appFontFamily,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: width / 5),
            decoration: BoxDecoration(
                color: AppColors.lightYellowTwo,
                borderRadius: BorderRadius.circular(width / 80)),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width / 20, vertical: height / 150),
              child: Text(name!, //AppString.data,
                  style: TextStyle(
                    color: AppColors.black,
                    fontFamily: AppString.appFontFamily,
                    fontSize: height / 60,
                    fontWeight: FontWeight.w500,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
