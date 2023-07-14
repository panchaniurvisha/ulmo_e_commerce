import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/common/app_elevated_button.dart';
import 'package:ulmo_e_commerce_app/res/common/app_list_tile.dart';
import 'package:ulmo_e_commerce_app/res/common/app_text.dart';
import 'package:ulmo_e_commerce_app/view/address_book_screen.dart';

import '../model/first_screen_model.dart';
import '../res/common/app_text_field.dart';
import '../res/common/row_app_bar.dart';
import '../res/constant/app_string.dart';
import '../utils/utils.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;
  Utils utils = Utils();
  AccountModel? userModel;
  final TextEditingController countryController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController houseNumberController = TextEditingController();
  final TextEditingController postCodeController = TextEditingController();
  User? user;

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
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const RowAppBar(
                  text: AppString.titleOfAddress,
                ),
                AppText(
                  text: AppString.contactInfo,
                  fontWeight: FontWeight.w600,
                  fontSize: height / 35,
                ),
                userModel == null
                    ? const CircularProgressIndicator()
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppListTile(
                              titleText: AppString.nameLabelText,
                              subTitleText: userModel!.fullName),
                          AppListTile(
                              titleText: AppString.numberLabelText,
                              subTitleText: userModel!.number),
                          AppListTile(
                              titleText: AppString.email,
                              subTitleText: userModel!.email),
                        ],
                      ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: height / 40),
                  child: AppText(
                    text: AppString.addressInfo,
                    fontWeight: FontWeight.w600,
                    fontSize: height / 35,
                  ),
                ),
                AppTextField(
                    controller: countryController,
                    labelText: AppString.labelOfCountry),
                AppTextField(
                  controller: cityController,
                  labelText: AppString.labelOfCity,
                ),
                AppTextField(
                  controller: streetController,
                  labelText: AppString.labelOfStreet,
                ),
                AppTextField(
                  controller: houseNumberController,
                  labelText: AppString.labelOfHouseNumber,
                ),
                AppTextField(
                  controller: postCodeController,
                  labelText: AppString.labelOfPostCode,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: height / 10),
                  child: AppElevatedButton(
                    onPressed: () => saveLocationToFireStore(),
                    sizeBox: const SizedBox(),
                    text: AppString.saveAddress,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  saveLocationToFireStore() async {
    CollectionReference users = firebaseFireStore.collection('user');
    users.doc(user!.uid).set({
      'city': cityController.text,
      'country': countryController.text,
      'street': streetController.text,
      'houseNumber': houseNumberController.text,
      "postCode": postCodeController.text
    }, SetOptions(merge: true)).then((value) {
      utils.showToastMessage(message: "user is added");
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const AddressBookScreen()));
    }).catchError((error) {
      debugPrint("Failed to add user$error");
    });
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
