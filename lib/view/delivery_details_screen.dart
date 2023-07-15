import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/common/app_outline_button.dart';
import 'package:ulmo_e_commerce_app/utils/routes/routes_name.dart';

import '../data/user_data_first_screen.dart';
import '../model/first_screen_model.dart';
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
  List<String> date = [
    AppString.tomorrow,
    AppString.date25,
    AppString.date26,
    AppString.date27,
  ];
  List<String> time = [
    AppString.twelve,
    AppString.twoOClock,
    AppString.four,
    AppString.six,
  ];
  List<Map> transactionSource = [
    {AppString.key: AppString.byCourier, AppString.name: AppString.timeOfData},
    {
      AppString.key: AppString.myselfCourier,
      AppString.name: AppString.timeOfTransaction
    }
  ];
  bool value = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    FirstScreenModel? userModel = FirstScreenModel.fromJson(userData);
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
              Padding(
                padding: EdgeInsets.symmetric(vertical: height / 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.location_on_outlined, size: height / 30),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(text: AppString.address),
                        AppText(
                            text: AppString.houseNumber, color: AppColors.gray),
                      ],
                    ),
                    InkWell(
                        child: Icon(Icons.navigate_next_outlined),
                        onTap: () {
                          showModalBottomSheet(
                            barrierColor: AppColors.black,
                            backgroundColor: Colors.transparent,
                            isScrollControlled: true,
                            isDismissible: true,
                            context: context,
                            builder: (context) => StatefulBuilder(
                              builder: (context, setState) => Container(
                                height: height / 2,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(width / 20),
                                      topRight: Radius.circular(width / 20),
                                    )),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: height / 30,
                                      horizontal: width / 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                        text: AppString.deliveryTitle,
                                        fontSize: height / 30,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      SizedBox(
                                        height: height / 40,
                                      ),
                                      GridView.builder(
                                        padding: EdgeInsets.only(
                                            bottom: height / 30),
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: userModel.address!.length,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 1,
                                          childAspectRatio: 2,
                                          mainAxisExtent: height / 12,
                                          crossAxisSpacing: width / 20,
                                        ),
                                        itemBuilder: (context, index) => Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: height / 40,
                                                  right: width / 60),
                                              child: Icon(
                                                  Icons.location_on_outlined,
                                                  size: height / 30),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                AppText(
                                                    text:
                                                        "${userModel.address![index].street}",
                                                    fontSize: height / 50),
                                                AppText(
                                                    text:
                                                        "${userModel.address![index].home}",
                                                    color: AppColors.gray,
                                                    fontSize: height / 60),
                                              ],
                                            ),
                                            CheckBoxButton(
                                              value: value,
                                              onTap: () {
                                                setState(() {
                                                  value = !value;
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      AppElevatedButton(
                                        text: AppString.cancel,
                                        color: AppColors.white,
                                        onPressed: () => Navigator.pushNamed(
                                            context,
                                            RoutesName.deliveryDetailsScreen),
                                        sizeBox: const SizedBox(),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        })
                  ],
                ),
              ),
              AppText(
                text: AppString.deliveryTime,
                fontWeight: FontWeight.w600,
                fontSize: height / 35,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: height / 40),
                child: SizedBox(
                  height: height / 20,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      width: width / 15,
                    ),
                    itemBuilder: (context, index) => AppOutlineButton(
                        text: date[index],
                        color: const MaterialStatePropertyAll(AppColors.white)),
                    itemCount: date.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                  ),
                ),
              ),
              SizedBox(
                height: height / 20,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    width: width / 15,
                  ),
                  itemBuilder: (context, index) => AppOutlineButton(
                      text: time[index],
                      color: const MaterialStatePropertyAll(AppColors.white)),
                  itemCount: time.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                ),
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
