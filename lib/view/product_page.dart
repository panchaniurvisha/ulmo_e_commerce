import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/data/user_data_first_screen.dart';
import 'package:ulmo_e_commerce_app/model/first_screen_model.dart';
import 'package:ulmo_e_commerce_app/res/common/app_column.dart';
import 'package:ulmo_e_commerce_app/res/common/app_container.dart';
import 'package:ulmo_e_commerce_app/res/common/app_elevated_button.dart';
import 'package:ulmo_e_commerce_app/res/common/app_text.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_colors.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_images.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_string.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  bool liked = false;
  pressed() {
    setState(() {
      liked = !liked;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    FirstScreenModel? userModel = FirstScreenModel.fromJson(userData);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    AppImages.bedSideTable,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width / 30, vertical: height / 45),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              color: AppColors.skyWhite,
                              shape: BoxShape.circle),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_back_rounded,
                                size: height / 30),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              color: AppColors.skyWhite,
                              shape: BoxShape.circle),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite, size: height / 30),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: height / 1.850,
                    left: width / 2.5,
                    child:
                        Image.asset(AppImages.pageControl, height: height / 50),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width / 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: AppString.price,
                      fontSize: height / 30,
                      fontWeight: FontWeight.w600,
                    ),
                    const AppText(
                      text: AppString.likesTable,
                      color: AppColors.gray,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: height / 60),
                      child: Row(
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(width / 50)),
                            ),
                            icon: Icon(Icons.circle_rounded,
                                color: AppColors.orangeColor),
                            label: Text(AppString.brown),
                          ),
                          SizedBox(
                            width: width / 20,
                          ),
                          ElevatedButton.icon(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.skyWhite,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(width / 50)),
                            ),
                            icon: Icon(Icons.circle_rounded,
                                color: AppColors.black),
                            label: Text(AppString.black,
                                style: TextStyle(color: AppColors.black)),
                          ),
                        ],
                      ),
                    ),
                    const AppElevatedButton(
                      text: AppString.addCart,
                    ),
                    SizedBox(
                      height: height / 30,
                    ),
                    AppContainer(
                      padding: Padding(
                        padding: EdgeInsets.only(left: width / 20),
                        child: const Icon(Icons.percent_outlined),
                      ),
                      text: AppString.discount,
                      data: AppString.promoCode,
                      name: AppString.copy,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: height / 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const AppText(
                            text: AppString.information,
                          ),
                          Icon(
                            Icons.navigate_next,
                            size: height / 30,
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        AppText(
                          text: AppString.review,
                        ),
                        AppText(
                          text: AppString.number,
                          color: AppColors.gray,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: height / 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          AppText(
                            text: AppString.question,
                          ),
                          AppText(
                            text: AppString.five,
                            color: AppColors.gray,
                          ),
                        ],
                      ),
                    ),
                    AppText(
                      text: AppString.headerName,
                      fontSize: height / 40,
                      fontWeight: FontWeight.w600,
                    ),
                    GridView.builder(
                        padding: EdgeInsets.only(top: height / 50),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: userModel.pageContentItem!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.50,
                          mainAxisExtent: height / 2.9,
                          crossAxisSpacing: width / 20,
                        ),
                        itemBuilder: (context, index) => AppColumn(
                              image:
                                  "${userModel.pageContentItem![index].popularImage}",
                              iconButton: IconButton(
                                icon: Image.asset(
                                  liked
                                      ? AppImages.disLikeIcon
                                      : AppImages.likeIcon,
                                  height: height / 40,
                                ),
                                onPressed: () => pressed(),
                              ),
                              text:
                                  "${userModel.pageContentItem![index].recentlyNew}",
                              data:
                                  "${userModel.pageContentItem![index].price}",
                              information:
                                  "${userModel.pageContentItem![index].itemName}",
                              index: index,
                            )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
