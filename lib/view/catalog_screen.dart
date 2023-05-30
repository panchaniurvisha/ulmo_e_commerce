import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/commen/app_gridview_builder.dart';
import 'package:ulmo_e_commerce_app/res/commen/row_app_bar.dart';
import 'package:ulmo_e_commerce_app/res/commen/search_bar.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_colors.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_string.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
          child: Padding(
            padding: EdgeInsets.all(height / 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RowAppBar(
                  text: AppString.title,
                ),
                SearchBar(),
                AppGridBuilder(),
                Container(
                  decoration: BoxDecoration(color: AppColors.black, borderRadius: BorderRadius.circular(width / 60)),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(height / 70),
                        child: Column(
                          children: [
                            Text(
                              AppString.text,
                              style: TextStyle(
                                color: AppColors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: height / 60,
                                fontFamily: AppString.appFontFamily,
                              ),
                            ),
                            Text(
                              AppString.help,
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
                      Container(
                        margin: EdgeInsets.only(left: width / 5),
                        decoration: BoxDecoration(color: AppColors.lightYellowTwo, borderRadius: BorderRadius.circular(width / 80)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: width / 20, vertical: height / 150),
                          child: Text(AppString.data,
                              style: TextStyle(
                                color: AppColors.black,
                                fontFamily: AppString.appFontFamily,
                                fontSize: height / 60,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
