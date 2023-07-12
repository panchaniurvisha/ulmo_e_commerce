import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/data/user_data_first_screen.dart';
import 'package:ulmo_e_commerce_app/model/first_screen_model.dart';
import 'package:ulmo_e_commerce_app/res/common/app_column.dart';
import 'package:ulmo_e_commerce_app/res/common/row_app_bar.dart';
import 'package:ulmo_e_commerce_app/res/common/search_bar.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_images.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_string.dart';

import '../res/common/app_container.dart';
import '../res/common/app_image_outline_button.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  FirstScreenModel? userModel = FirstScreenModel.fromJson(userData);
  List<bool> likedList = [];
  List<bool> disLikedList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    disLikedList =
        List.generate(userModel!.popularItem!.length, (index) => true);
    likedList = List.generate(userModel!.catalogItem!.length, (index) => false);
  }

  _pressedDislike(int index) {
    setState(() {
      disLikedList[index] = !disLikedList[index];
    });
  }

  pressed(int index) {
    setState(() {
      likedList[index] = !likedList[index];
    });
  }

  @override
  Widget build(BuildContext context) {
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
                const AppSearchBar(),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppImageOutLineButton(
                        text: AppString.sortButton, image: AppImages.sortIcon),
                    AppImageOutLineButton(
                        text: AppString.filterButton,
                        image: AppImages.filterIcon)
                  ],
                ),
                SizedBox(
                  height: height / 40,
                ),
                GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: userModel!.popularItem!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.50,
                      mainAxisExtent: height / 2.9,
                      crossAxisSpacing: width / 20,
                    ),
                    itemBuilder: (context, index) => AppColumn(
                          image:
                              "${userModel!.popularItem![index].popularImage}",
                          text: "${userModel!.popularItem![index].recentlyNew}",
                          iconButton: IconButton(
                              icon: Image.asset(
                                disLikedList[index]
                                    ? AppImages.disLikeIcon
                                    : AppImages.likeIcon,
                                height: height / 40,
                              ),
                              onPressed: () => _pressedDislike(index)),
                          data: "${userModel!.popularItem![index].price}",
                          information:
                              "${userModel!.popularItem![index].itemName}",
                          index: index,
                        )),
                const AppContainer(
                  text: AppString.text,
                  data: AppString.help,
                  name: AppString.data,
                ),
                GridView.builder(
                    padding: EdgeInsets.only(top: height / 45),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: userModel!.catalogItem!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.50,
                      mainAxisExtent: height / 2.9,
                      crossAxisSpacing: width / 20,
                    ),
                    itemBuilder: (context, index) => AppColumn(
                          image:
                              "${userModel!.catalogItem![index].popularImage}",
                          text: "${userModel!.catalogItem![index].recentlyNew}",
                          data: "${userModel!.catalogItem![index].price}",
                          iconButton: IconButton(
                            icon: Image.asset(
                              likedList[index]
                                  ? AppImages.disLikeIcon
                                  : AppImages.likeIcon,
                              height: height / 40,
                            ),
                            onPressed: () => pressed(index),
                          ),
                          information:
                              "${userModel!.catalogItem![index].itemName}",
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
