import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/data/user_data_first_screen.dart';
import 'package:ulmo_e_commerce_app/model/first_screen_model.dart';
import 'package:ulmo_e_commerce_app/res/commen/app_column.dart';
import 'package:ulmo_e_commerce_app/res/commen/row_app_bar.dart';
import 'package:ulmo_e_commerce_app/res/commen/search_bar.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_colors.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_string.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  @override
  Widget build(BuildContext context) {
    FirstScreenModel? userModel = FirstScreenModel.fromJson(userData);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
          child: Padding(
            padding: EdgeInsets.all(height / 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const RowAppBar(
                  text: AppString.title,
                ),
                const SearchBar(),
                GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: userModel.popularItem!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.50,
                      mainAxisExtent: height / 2.9,
                      crossAxisSpacing: width / 20,
                    ),
                    itemBuilder: (context, index) => AppColumn(
                          image: "${userModel.popularItem![index].popularImage}",
                          text: "${userModel.popularItem![index].recentlyNew}",
                          data: "${userModel.popularItem![index].price}",
                          information: "${userModel.popularItem![index].itemName}",
                          index: index,
                        )),
                Container(
                  decoration: BoxDecoration(color: AppColors.skyWhite, borderRadius: BorderRadius.circular(width / 60)),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(height / 70),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                ),
                GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: userModel.catalogItem!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.50,
                      mainAxisExtent: height / 2.9,
                      crossAxisSpacing: width / 20,
                    ),
                    itemBuilder: (context, index) => AppColumn(
                          image: "${userModel.catalogItem![index].popularImage}",
                          text: "${userModel.catalogItem![index].recentlyNew}",
                          data: "${userModel.catalogItem![index].price}",
                          information: "${userModel.catalogItem![index].itemName}",
                          index: index,
                        )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
