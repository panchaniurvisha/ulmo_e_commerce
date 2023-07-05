import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_colors.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_string.dart';

class AppSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  const AppSearchBar({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height / 40),
      child: TextField(
        autofocus: true,
        // enabled: true,
        //readOnly: true,
        style: TextStyle(
          color: AppColors.black,
          fontWeight: FontWeight.w400,
          fontSize: height / 42,
          fontFamily: "Poppins",
          fontStyle: FontStyle.normal,
        ),
        cursorColor: AppColors.black,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: height / 60),
            prefixIcon: const Icon(Icons.search_rounded, color: AppColors.gray),
            counter: Container(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: width / 40, color: AppColors.white),
              borderRadius: BorderRadius.all(
                Radius.circular(width / 35),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: height / 350, color: AppColors.black),
              borderRadius: BorderRadius.all(
                Radius.circular(width / 35),
              ),
            ),
            hintText: AppString.search,
            hintStyle: TextStyle(
                fontFamily: AppString.appFontFamily,
                fontSize: height / 50,
                fontWeight: FontWeight.w400,
                color: AppColors.gray),
            filled: true,
            fillColor: AppColors.white),
      ),
    );
  }
}
