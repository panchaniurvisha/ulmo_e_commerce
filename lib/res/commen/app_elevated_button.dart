import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/commen/app_text.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_colors.dart';

class AppElevatedButton extends StatelessWidget {
  final String? text;
  final SizedBox? sizeBox;
  final Color? color;
  final void Function()? onPressed;
  const AppElevatedButton({
    Key? key,
    this.text,
    this.sizeBox,
    this.color,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? AppColors.lightYellowTwo,
        fixedSize: const Size(400, 55),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(width / 40)),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText(
            text: text!,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(
            width: width / 30,
          ),
          sizeBox ??
              Icon(
                // <-- Icon
                Icons.shopping_bag_outlined,
                color: AppColors.black,
              ),
        ],
      ),
    );
  }
}
