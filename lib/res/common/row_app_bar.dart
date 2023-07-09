import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/common/app_text.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_colors.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_string.dart';

class RowAppBar extends StatelessWidget {
  final String? text;
  final Icon? icon;
  final String? actionText;

  const RowAppBar({
    Key? key,
    this.text,
    this.icon,
    this.actionText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.white,
      leading: IconButton(
        padding: EdgeInsets.only(right: width / 15),
        onPressed: () {},
        icon: icon ??
            Icon(Icons.arrow_back_rounded,
                size: height / 30, color: AppColors.black),
      ),
      titleSpacing: width / 5,
      title: AppText(
        text: text ?? AppString.room,
        fontWeight: FontWeight.w500,
      ),
      actions: [
        AppText(
          text: actionText ?? "",
          fontWeight: FontWeight.w500,
        ),
      ],
    );
  }
}
