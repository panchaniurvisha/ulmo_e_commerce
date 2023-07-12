import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/common/app_text.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_colors.dart';

class AppImageOutLineButton extends StatelessWidget {
  final String? text;
  final String? image;
  const AppImageOutLineButton({super.key, this.image, this.text});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width / 2.4,
      child: OutlinedButton(
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(AppColors.white)),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
                text: text!,
                fontWeight: FontWeight.w500,
                fontSize: height / 60),
            Image.asset(image!, height: height / 40)
          ],
        ),
      ),
    );
  }
}
