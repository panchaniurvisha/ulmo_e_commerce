import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_colors.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_string.dart';

class RowAppBar extends StatelessWidget {
  final String? text;
  final Icon? icon;
  final double? width;
  final MainAxisAlignment? mainAxisAlignment;
  const RowAppBar({
    Key? key,
    this.text,
    this.icon,
    this.width,
    this.mainAxisAlignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: mainAxisAlignment!,
      children: [
        IconButton(
          padding: EdgeInsets.only(right: width / 15),
          onPressed: () {},
          icon: icon ?? Icon(Icons.arrow_back_rounded, size: height / 30),
        ),
        SizedBox(
          width: width / 5,
        ),
        Text(
          text ?? AppString.room,
          style: TextStyle(
            color: AppColors.black,
            fontSize: height / 50,
            fontWeight: FontWeight.w500,
            fontFamily: AppString.appFontFamily,
          ),
        )
      ],
    );
  }
}
