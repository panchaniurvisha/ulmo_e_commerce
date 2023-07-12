import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/common/app_outline_button.dart';

import '../res/common/app_elevated_button.dart';
import '../res/common/app_text.dart';
import '../res/common/check_box_button.dart';
import '../res/common/row_app_bar.dart';
import '../res/constant/app_colors.dart';
import '../res/constant/app_string.dart';

class DeliveryDetailsScreen extends StatefulWidget {
  const DeliveryDetailsScreen({super.key});

  @override
  State<DeliveryDetailsScreen> createState() => _DeliveryDetailsScreenState();
}

class _DeliveryDetailsScreenState extends State<DeliveryDetailsScreen> {
  List<Map> transactionSource = [
    {AppString.key: AppString.byCourier, AppString.name: AppString.timeOfData},
    {
      AppString.key: AppString.myselfCourier,
      AppString.name: AppString.timeOfTransaction
    }
  ];
  bool value = true;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(height / 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const RowAppBar(
                text: AppString.paymentTitle,
              ),
              Align(
                alignment: Alignment.center,
                child: AppText(
                  text: AppString.numberOutOf3,
                  fontWeight: FontWeight.w500,
                  fontSize: height / 60,
                  color: AppColors.gray,
                ),
              ),
              AppText(
                text: AppString.deliveryMethod,
                fontWeight: FontWeight.w600,
                fontSize: height / 35,
              ),
              GridView.builder(
                padding: EdgeInsets.only(
                  bottom: height / 40,
                  top: height / 40,
                ),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: transactionSource.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 2,
                  mainAxisExtent: height / 12,
                  crossAxisSpacing: width / 20,
                ),
                itemBuilder: (context, index) => StatefulBuilder(
                  builder: (context, setState) => Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: height / 40, right: width / 20),
                        child: Icon(
                            index == 0
                                ? Icons.directions_car_outlined
                                : Icons.shopping_cart_outlined,
                            size: height / 30),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                              text: transactionSource[index][AppString.key]),
                          AppText(
                              text: transactionSource[index][AppString.name],
                              color: AppColors.gray,
                              fontSize: height / 55),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: index == 0 ? width / 2.8 : width / 3.5,
                                bottom: width / 12),
                            child: CheckBoxButton(
                              value: value,
                              onTap: () {
                                setState(() {
                                  value = !value;
                                });
                              },
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              AppText(
                text: AppString.deliveryAddress,
                fontWeight: FontWeight.w600,
                fontSize: height / 35,
              ),
              StatefulBuilder(
                builder: (context, setState) => Padding(
                  padding: EdgeInsets.symmetric(vertical: height / 30),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: width / 20),
                        child:
                            Icon(Icons.location_on_outlined, size: height / 30),
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(text: AppString.address),
                          AppText(
                              text: AppString.houseNumber,
                              color: AppColors.gray),
                        ],
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: width / 15),
                          child: CheckBoxButton(
                            value: value,
                            onTap: () {
                              setState(() {
                                value = !value;
                              });
                            },
                          )),
                    ],
                  ),
                ),
              ),
              AppText(
                text: AppString.deliveryTime,
                fontWeight: FontWeight.w600,
                fontSize: height / 35,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AppOutlineButton(
                    text: AppString.tomorrow,
                  ),
                  AppOutlineButton(text: AppString.date25),
                  AppOutlineButton(text: AppString.date26),
                  AppOutlineButton(text: AppString.date27)
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppOutlineButton(text: AppString.twelve),
                  AppOutlineButton(text: AppString.twoOClock),
                  AppOutlineButton(text: AppString.four),
                  AppOutlineButton(text: AppString.six)
                ],
              ),
              const Spacer(),
              const AppElevatedButton(
                sizeBox: SizedBox(),
                text: AppString.continueButton,
              )
            ],
          ),
        ),
      ),
    );
  }
}
