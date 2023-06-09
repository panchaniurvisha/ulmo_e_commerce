import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_colors.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_images.dart';

import '../res/commen/app_text.dart';
import '../res/constant/app_string.dart';

class BegScreen extends StatefulWidget {
  const BegScreen({Key? key}) : super(key: key);

  @override
  State<BegScreen> createState() => _BegScreenState();
}

class _BegScreenState extends State<BegScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: height / 20, horizontal: width / 33),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppText(
                    text: AppString.bag,
                    fontWeight: FontWeight.w600,
                    fontSize: height / 30),
                Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(width / 40),
                          topLeft: Radius.circular(width / 40),
                        ),
                        child: Image.asset(AppImages.bedSideTable,
                            height: height / 7)),
                    SizedBox(
                      width: width / 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: AppString.price,
                          fontWeight: FontWeight.w500,
                          fontSize: height / 40,
                        ),
                        AppText(
                          text: AppString.aboutTable,
                          color: AppColors.gray,
                          fontSize: height / 55,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(width / 40),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {}, icon: Icon(Icons.remove)),
                              Text("0"),
                              IconButton(
                                  onPressed: () {}, icon: Icon(Icons.add))
                            ],
                          ),
                        )
                      ],
                    ),
                    Icon(
                      Icons.highlight_off,
                      color: AppColors.gray,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
