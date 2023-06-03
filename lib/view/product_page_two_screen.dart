import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_colors.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_images.dart';

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
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(AppImages.productImage),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width / 30, vertical: height / 45),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: AppColors.skyWhite, shape: BoxShape.circle),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_back_rounded, size: height / 30),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          color: AppColors.skyWhite, shape: BoxShape.circle),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_border_rounded,
                            size: height / 30),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
