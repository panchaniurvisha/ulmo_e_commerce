import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/data/user_data_first_screen.dart';
import 'package:ulmo_e_commerce_app/model/first_screen_model.dart';
import 'package:ulmo_e_commerce_app/res/commen/app_gridview_builder.dart';
import 'package:ulmo_e_commerce_app/res/commen/search_bar.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_colors.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_string.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> data = [
    AppString.bedRoom,
    AppString.livingRoom,
    AppString.kitchen,
    AppString.dining,
    AppString.bathroom,
  ];
  TextEditingController searchEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    FirstScreenModel? userModel = FirstScreenModel.fromJson(userData);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: height / 15,
              horizontal: width / 35,
            ),
            child: Column(
              children: [
                Text(
                  AppString.appName,
                  style: TextStyle(
                      fontSize: height / 30,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                      fontFamily: AppString.appFontFamily),
                ),
                SearchBar(controller: searchEditingController),
                SizedBox(
                  height: height / 7,
                  child: ListView.separated(
                      padding: EdgeInsets.symmetric(
                        vertical: height / 60,
                      ),
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(width / 50),
                                child: Image.asset(
                                  "${userModel.pageContent![index].image}",
                                ),
                              ),
                              Positioned(
                                top: height / 20,
                                left: width / 40,
                                child: Text(
                                  "${userModel.pageContent![index].label}",
                                  style: TextStyle(
                                    color: AppColors.skyWhite,
                                    fontFamily: AppString.appFontFamily,
                                    fontWeight: FontWeight.w500,
                                    fontSize: height / 50,
                                  ),
                                ),
                              )
                            ],
                          ),
                      separatorBuilder: (context, index) => SizedBox(
                            width: width / 40,
                          ),
                      itemCount: userModel.pageContent!.length),
                ),
                ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Container(
                          height: height / 8,
                          decoration: BoxDecoration(
                            color: AppColors.skyWhite,
                            borderRadius: BorderRadius.circular(width / 50),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: height / 15, left: width / 30),
                                child: Text(data[index],
                                    style: TextStyle(
                                      fontSize: height / 35,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: AppString.appFontFamily,
                                      color: AppColors.black,
                                    )),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(
                                      width / 50,
                                    ),
                                    topRight: Radius.circular(width / 50)),
                                child: Image.asset(
                                    "${userModel.roomFacility![index].facilityImage}"),
                              )
                            ],
                          ),
                        ),
                    separatorBuilder: (context, index) => SizedBox(
                          height: height / 50,
                        ),
                    itemCount: userModel.roomFacility!.length),
                SizedBox(
                  height: height / 10,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: height / 35,
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        AppString.popularItem,
                        style: TextStyle(
                          color: AppColors.black,
                          fontFamily: AppString.appFontFamily,
                          fontWeight: FontWeight.w600,
                          fontSize: height / 35,
                        ),
                      ),
                    ),
                  ),
                ),
                const AppGridViewBuilder(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
