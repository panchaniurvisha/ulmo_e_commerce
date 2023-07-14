import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/common/app_text.dart';
import 'package:ulmo_e_commerce_app/res/common/row_app_bar.dart';

import '../model/first_screen_model.dart';
import '../res/common/app_elevated_button.dart';
import '../res/constant/app_colors.dart';
import '../res/constant/app_string.dart';
import 'address_screen.dart';

class AddressBookScreen extends StatefulWidget {
  const AddressBookScreen({super.key});

  @override
  State<AddressBookScreen> createState() => _AddressBookScreenState();
}

class _AddressBookScreenState extends State<AddressBookScreen> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;
  AccountModel? userModel;
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
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 28),
          child: Column(
            children: [
              const RowAppBar(
                text: AppString.titleOfScreen,
              ),
              userModel == null
                  ? const CircularProgressIndicator()
                  : Row(children: [
                      Icon(Icons.location_on_outlined, size: height / 22),
                      Padding(
                        padding: EdgeInsets.only(left: width / 30),
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
              SizedBox(
                height: height / 10,
              ),
              AppElevatedButton(
                color: AppColors.white,
                text: AppString.buttonOfAddressBook,
                sizeBox: const SizedBox(),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddressScreen())),
              )
            ],
          ),
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
