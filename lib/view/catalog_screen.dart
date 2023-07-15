import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/data/user_data_first_screen.dart';
import 'package:ulmo_e_commerce_app/model/first_screen_model.dart';
import 'package:ulmo_e_commerce_app/res/common/app_column.dart';
import 'package:ulmo_e_commerce_app/res/common/row_app_bar.dart';
import 'package:ulmo_e_commerce_app/res/common/search_bar.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_images.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_string.dart';

import '../res/common/app_container.dart';
import '../res/common/app_elevated_button.dart';
import '../res/common/app_image_outline_button.dart';
import '../res/common/app_text.dart';
import '../res/common/check_box_button.dart';
import '../res/constant/app_colors.dart';
import '../utils/routes/routes_name.dart';

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
  bool value = true;
  List<String> sortTitle = [
    AppString.priceHighToLow,
    AppString.priceLowToHigh,
    AppString.newFirst,
    AppString.popularFirst,
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    disLikedList = List.generate(userModel!.popularItem!.length, (index) => true);
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppImageOutLineButton(
                        text: AppString.sortButton,
                        image: AppImages.sortIcon,
                        onPressed: () {
                          showModalBottomSheet(
                            barrierColor: AppColors.black,
                            backgroundColor: Colors.transparent,
                            isScrollControlled: true,
                            isDismissible: true,
                            context: context,
                            builder: (context) => StatefulBuilder(
                              builder: (context, setState) => Container(
                                height: height / 1.7,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(width / 20),
                                      topRight: Radius.circular(width / 20),
                                    )),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: height / 30, horizontal: width / 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                        text: AppString.sortTitle,
                                        fontSize: height / 25,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      GridView.builder(
                                        padding: EdgeInsets.only(bottom: height / 30),
                                        physics: const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: sortTitle.length,
                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 1,
                                          childAspectRatio: 2,
                                          mainAxisExtent: height / 12,
                                          crossAxisSpacing: width / 20,
                                        ),
                                        itemBuilder: (context, index) => Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            AppText(text: sortTitle[index]),
                                            index == 0
                                                ? CheckBoxButton(
                                                    value: value,
                                                    onTap: () {
                                                      setState(() {
                                                        value = !value;
                                                      });
                                                    },
                                                  )
                                                : const SizedBox(),
                                          ],
                                        ),
                                      ),
                                      const AppElevatedButton(
                                        text: AppString.cancel,
                                        color: AppColors.white,
                                        sizeBox: SizedBox(),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                    AppImageOutLineButton(text: AppString.filterButton, image: AppImages.filterIcon, onPressed: () => Navigator.pushNamed(context, RoutesName.filterScreen))
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
                          image: "${userModel!.popularItem![index].popularImage}",
                          onTap: () => index == 0 ? Navigator.pushNamed(context, RoutesName.productPage) : Navigator.pushNamed(context, RoutesName.catalogScreen),
                          text: "${userModel!.popularItem![index].recentlyNew}",
                          iconButton: IconButton(
                              icon: Image.asset(
                                disLikedList[index] ? AppImages.disLikeIcon : AppImages.likeIcon,
                                height: height / 40,
                              ),
                              onPressed: () => _pressedDislike(index)),
                          data: "${userModel!.popularItem![index].price}",
                          information: "${userModel!.popularItem![index].itemName}",
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
                          onTap: () {},
                          image: "${userModel!.catalogItem![index].popularImage}",
                          text: "${userModel!.catalogItem![index].recentlyNew}",
                          data: "${userModel!.catalogItem![index].price}",
                          iconButton: IconButton(
                            icon: Image.asset(
                              likedList[index] ? AppImages.disLikeIcon : AppImages.likeIcon,
                              height: height / 40,
                            ),
                            onPressed: () => pressed(index),
                          ),
                          information: "${userModel!.catalogItem![index].itemName}",
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
