import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/commen/app_text.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_colors.dart';

class AppElevatedButton extends StatelessWidget {
  final String? text;
  const AppElevatedButton({
    Key? key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lightYellowTwo,
        fixedSize: const Size(400, 60),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      onPressed: () {},
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
          const Icon(
            // <-- Icon
            Icons.shopping_bag_outlined,
            color: AppColors.black,
          ),
        ],
      ),
    );
  }
}
