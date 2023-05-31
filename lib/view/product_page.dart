import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_images.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(AppImages.bedSideTable),
              Row(
                children: [],
              )
            ],
          )
        ],
      ),
    );
  }
}
