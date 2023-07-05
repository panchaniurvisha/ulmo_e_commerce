import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/data/user_data_first_screen.dart';
import 'package:ulmo_e_commerce_app/model/first_screen_model.dart';
import 'package:ulmo_e_commerce_app/res/common/app_column.dart';
import 'package:ulmo_e_commerce_app/res/common/app_elevated_button.dart';
import 'package:ulmo_e_commerce_app/res/common/app_text.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_colors.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_images.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_string.dart';

class ProductPageTwoScreen extends StatefulWidget {
  const ProductPageTwoScreen({Key? key}) : super(key: key);

  @override
  State<ProductPageTwoScreen> createState() => _ProductPageTwoScreenState();
}

class _ProductPageTwoScreenState extends State<ProductPageTwoScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    FirstScreenModel? userModel = FirstScreenModel.fromJson(userData);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(AppImages.productImage),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width / 30, vertical: height / 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: AppColors.skyWhite70,
                            shape: BoxShape.circle),
                        child: IconButton(
                          onPressed: () {},
                          icon:
                              Icon(Icons.arrow_back_rounded, size: height / 30),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: AppColors.skyWhite70,
                            shape: BoxShape.circle),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite_border_rounded,
                              size: height / 30),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: height / 1.850,
                  left: width / 2.5,
                  child: Image.asset(AppImages.pageControlImage,
                      height: height / 50),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width / 30, vertical: height / 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: AppString.dollar,
                    fontSize: height / 30,
                    fontWeight: FontWeight.w600,
                  ),
                  const AppText(
                    text: AppString.woodType,
                    color: AppColors.gray,
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  const AppElevatedButton(
                    text: AppString.addCart,
                  ),
                  SizedBox(
                    height: height / 30,
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
                            icon: "${userModel.pageContentItem![index].icon}",
                            text:
                                "${userModel.pageContentItem![index].recentlyNew}",
                            data: "${userModel.pageContentItem![index].price}",
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
    );
  }
}
