import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/common/app_text.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_colors.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_string.dart';

class AppContainer extends StatelessWidget {
  final String? text;
  final String? data;
  final String? name;
  final Widget? appText;
  final Widget? appTextOne;
  final Padding? padding;
  final SizedBox? sizedBox;

  const AppContainer({
    Key? key,
    this.text,
    this.data,
    this.name,
    this.padding,
    this.sizedBox,
    this.appText,
    this.appTextOne,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(width / 60)),
      child: Row(
        children: [
          padding ?? const SizedBox(),
          Padding(
            padding: EdgeInsets.all(height / 70),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appText ??
                    Text(
                      text!, //AppString.text,
                      style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: height / 60,
                        fontFamily: AppString.appFontFamily,
                      ),
                    ),
                appTextOne ??
                    Text(
                      data!, //AppString.help,
                      style: TextStyle(
                        color: AppColors.gray,
                        fontWeight: FontWeight.w400,
                        fontSize: height / 70,
                        fontFamily: AppString.appFontFamily,
                      ),
                    )
              ],
            ),
          ),
          sizedBox ?? const Spacer(),
          OutlinedButton(
              style: const ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(AppColors.lightYellowTwo),
              ),
              onPressed: () {},
              child: AppText(
                text: name!,
                fontWeight: FontWeight.w500,
              )),
          const Spacer(),
        ],
      ),
    );
  }
}
