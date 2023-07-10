import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/common/app_text.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_string.dart';

class AppSortFilterButton extends StatelessWidget {
  const AppSortFilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OutlinedButton.icon(
            // <-- OutlinedButton
            onPressed: () {},
            icon: Icon(
              Icons.sort_rounded,
              size: 24.0,
            ),
            label: AppText(
              text: AppString.sort,
              fontWeight: FontWeight.w500,
            )),
        OutlinedButton.icon(
          // <-- OutlinedButton
          onPressed: () {},

          label: AppText(
            text: AppString.filterButton,
            fontWeight: FontWeight.w500,
          ),
          icon: Icon(
            Icons.filter,
            size: 24.0,
          ),
        )
      ],
    );
  }
}
