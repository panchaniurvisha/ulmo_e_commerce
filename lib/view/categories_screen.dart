import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/commen/row_app_bar.dart';
import 'package:ulmo_e_commerce_app/res/commen/search_bar.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_colors.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_images.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_string.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<Map> categories = [
    {AppString.image: AppImages.furniture, AppString.name: AppString.furniture},
    {AppString.image: AppImages.lighting, AppString.name: AppString.lighting},
    {AppString.image: AppImages.rugs, AppString.name: AppString.rugs},
    {AppString.image: AppImages.mirrors, AppString.name: AppString.mirrors},
    {AppString.image: AppImages.blankets, AppString.name: AppString.blankets},
    {AppString.image: AppImages.cushions, AppString.name: AppString.cushions},
    {AppString.image: AppImages.curtains, AppString.name: AppString.curtains},
    {AppString.image: AppImages.basket, AppString.name: AppString.baskets},
    {AppString.image: AppImages.vases, AppString.name: AppString.vases},
    {AppString.image: AppImages.boxes, AppString.name: AppString.boxes},
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
          child: Padding(
            padding: EdgeInsets.all(height / 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const RowAppBar(),
                const SearchBar(),
                Text(
                  AppString.categories,
                  style: TextStyle(
                    fontFamily: AppString.appFontFamily,
                    fontWeight: FontWeight.w600,
                    fontSize: height / 35,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(
                  height: height / 1.7,
                  child: ListView.separated(
                    padding: EdgeInsets.only(top: height / 30),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => Row(
                      children: [
                        Image.asset(
                          categories[index][AppString.image],
                          height: height / 15,
                        ),
                        SizedBox(width: width / 20),
                        Text(categories[index][AppString.name],
                            style: TextStyle(
                              color: AppColors.black,
                              fontSize: height / 50,
                              fontWeight: FontWeight.w400,
                              fontFamily: AppString.appFontFamily,
                            )),
                      ],
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      height: height / 40,
                    ),
                    itemCount: categories.length,
                    shrinkWrap: true,
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
