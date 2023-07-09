import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/common/app_text.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_colors.dart';

class RowAppBar extends StatelessWidget {
  final String? text;
  final Widget? icon;
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
        padding: EdgeInsets.only(right: width / 2),
        onPressed: () => Navigator.pop(context),
        icon: icon ??
            Icon(
              Icons.arrow_back_rounded,
              size: height / 30,
              color: AppColors.black,
            ),
      ),
      titleSpacing: width / 5,
      title: AppText(
        text: text ?? "",
        fontWeight: FontWeight.w500,
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(top: height / 60),
          child: AppText(
            text: actionText ?? "",
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
