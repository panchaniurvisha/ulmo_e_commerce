import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/common/app_text.dart';

import '../model/first_screen_model.dart';
import '../res/common/app_outline_button.dart';
import '../res/common/row_app_bar.dart';
import '../res/constant/app_colors.dart';
import '../res/constant/app_images.dart';
import '../res/constant/app_string.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  AccountModel? userModel;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;
  @override
  void initState() {
    // TODO: implement initState
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width / 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RowAppBar(
              text: AppString.order,
            ),
            AppText(
                text: AppString.timeOfOrder,
                fontWeight: FontWeight.w600,
                fontSize: height / 40),
            AppText(
                text: AppString.aboutTime,
                fontSize: height / 60,
                color: AppColors.gray),
            Padding(
              padding: EdgeInsets.symmetric(vertical: height / 30),
              child: Row(
                children: [
                  ClipRRect(
                      borderRadius:
                          BorderRadius.all(Radius.circular(width / 40)),
                      child: Image.asset(AppImages.bedSideTable,
                          height: height / 7)),
                  SizedBox(
                    width: width / 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const AppText(
                            text: AppString.price,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      AppText(
                        text: AppString.aboutTable,
                        color: AppColors.gray,
                        fontSize: height / 55,
                      ),
                      const AppOutlineButton(
                        text: AppString.orderAgain,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(width / 40)),
                    child:
                        Image.asset(AppImages.squareTable, height: height / 7)),
                SizedBox(
                  width: width / 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const AppText(
                          text: AppString.dollarPrice,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    AppText(
                      text: AppString.aboutBedSideTable,
                      color: AppColors.gray,
                      fontSize: height / 55,
                    ),
                    const AppOutlineButton(
                      text: AppString.orderAgain,
                    )
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: height / 30),
              child: AppText(
                text: AppString.deliveryInfo,
                fontSize: height / 40,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              children: [
                Icon(Icons.directions_car_outlined, size: height / 30),
                SizedBox(
                  width: width / 20,
                ),
                const AppText(
                  text: AppString.byCourier,
                )
              ],
            ),
            userModel == null
                ? const CircularProgressIndicator()
                : Padding(
                    padding: EdgeInsets.symmetric(vertical: height / 30),
                    child: Row(children: [
                      Icon(Icons.location_on_outlined, size: height / 30),
                      Padding(
                        padding: EdgeInsets.only(left: width / 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                AppText(text: userModel!.country),
                                AppText(text: userModel!.city),
                                AppText(text: ",${userModel!.street}"),
                              ],
                            ),
                            Row(
                              children: [
                                AppText(
                                    text: userModel!.number,
                                    color: AppColors.gray,
                                    fontSize: height / 60),
                                AppText(
                                    text: ",PostCode :${userModel!.postCode}",
                                    color: AppColors.gray,
                                    fontSize: height / 60),
                              ],
                            )
                          ],
                        ),
                      )
                    ]),
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  text: AppString.total,
                  fontWeight: FontWeight.w600,
                  fontSize: height / 40,
                ),
                AppText(
                  text: AppString.fourHundredTwenty,
                  fontWeight: FontWeight.w600,
                  fontSize: height / 40,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AppText(
                  text: AppString.promoTitle,
                  color: AppColors.gray,
                ),
                AppText(
                  text: AppString.twentyFive,
                  color: AppColors.gray,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  getUser() {
    if (firebaseAuth.currentUser != null) {
      CollectionReference users = firebaseFireStore.collection("user");
      users.doc(firebaseAuth.currentUser!.uid).get().then((value) {
        debugPrint(
            "User Added successfully  --------> ${jsonEncode(value.data())}");
        userModel = accountModelFromJson(jsonEncode(value.data()));
        setState(() {});
      }).catchError((error) {
        debugPrint("Failed to get user  : $error");
      });
    }
  }
}
