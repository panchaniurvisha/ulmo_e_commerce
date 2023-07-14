import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/common/app_outline_button.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_colors.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_string.dart';

class AppColumn extends StatelessWidget {
  final int? index;
  final String? text;
  final String? data;
  final Widget? appOutlineButton;
  final String? information;
  final String? image;
  final Widget? iconButton;
  final void Function()? onTap;
  const AppColumn({
    Key? key,
    this.index,
    this.text,
    this.data,
    this.information,
    this.image,
    this.iconButton,
    this.appOutlineButton,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Stack(children: [
          InkWell(
              child: Image.asset(
                image!,
              ),
              onTap: onTap!),
          index == 0
              ? Positioned(
                  left: width / 50,
                  top: height / 100,
                  child: SizedBox(
                    height: height / 28,
                    child: AppOutlineButton(text: text!),
                  ),
                )
              : const SizedBox()
        ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(data!, //"${userModel.popularItem![index].price}",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: height / 45,
                  fontWeight: FontWeight.w500,
                  fontFamily: AppString.appFontFamily,
                  color: AppColors.black,
                )),
            iconButton!

            //"${userModel.popularItem![index].icon}",
          ],
        )
      ],
    );
  }
}
