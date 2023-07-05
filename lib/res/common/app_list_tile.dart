import 'package:flutter/material.dart';

import '../constant/app_colors.dart';
import 'app_text.dart';

class AppListTile extends StatelessWidget {
  final String? titleText;
  final String? subTitleText;
  const AppListTile({super.key, this.titleText, this.subTitleText});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: height / 30),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(width / 30)),
      child: ListTile(
        title: AppText(
            text: titleText!, fontSize: height / 60, color: AppColors.gray),
        subtitle: AppText(text: subTitleText!),
      ),
    );
  }
}
