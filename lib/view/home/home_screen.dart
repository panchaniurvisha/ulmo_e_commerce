import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/data/user_data_first_screen.dart';
import 'package:ulmo_e_commerce_app/model/first_screen_model.dart';
import 'package:ulmo_e_commerce_app/res/commen/search_bar.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_colors.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_string.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                height: height / 10,
                child: ListView.separated(
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(width / 1),
                              ),
                              child: Image.asset(
                                "${userModel.pageContent![index].image}",
                              ),
                            ),
                            Positioned(
                              top: height / 20,
                              child: Text(
                                "${userModel.pageContent![index].label}",
                                style: TextStyle(
                                  color: AppColors.skyWhite,
                                  fontFamily: AppString.appFontFamily,
                                  fontWeight: FontWeight.w500,
                                  fontSize: height / 60,
                                ),
                              ),
                            )
                          ],
                        ),
                    separatorBuilder: (context, index) => SizedBox(
                          width: width / 20,
                        ),
                    itemCount: userModel.pageContent!.length),
              ),
              ListView.separated(
                  shrinkWrap: true,
                  physics: AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => Container(
                        height: height / 10,
                        decoration: BoxDecoration(
                          color: AppColors.skyWhite,
                          borderRadius: BorderRadius.circular(width / 10),
                        ),
                        child: Row(
                          children: [Text()],
                        ),
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        width: width / 20,
                      ),
                  itemCount: userModel.roomFacility!.length),
            ],
          ),
        ),
      ),
    );
  }
}
