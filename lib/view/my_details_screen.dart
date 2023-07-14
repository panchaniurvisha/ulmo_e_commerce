import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/model/first_screen_model.dart';
import 'package:ulmo_e_commerce_app/res/common/app_list_tile.dart';
import 'package:ulmo_e_commerce_app/res/common/app_text.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_string.dart';

import '../utils/utils.dart';

class MyDetailsScreen extends StatefulWidget {
  const MyDetailsScreen({Key? key}) : super(key: key);

  @override
  State<MyDetailsScreen> createState() => _MyDetailsScreenState();
}

class _MyDetailsScreenState extends State<MyDetailsScreen> {
  CollectionReference users = FirebaseFirestore.instance.collection('user');
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;
  Utils utils = Utils();
  AccountModel? userModel;
  @override
  void initState() {
    // TODO: implement initState
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 28),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  padding: EdgeInsets.only(right: width / 10),
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back,
                  ),
                ),
                const AppText(
                  text: AppString.titleOFDetails,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            userModel == null
                ? CircularProgressIndicator()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(userModel!.image!)),
                      AppListTile(
                          titleText: AppString.nameLabelText,
                          subTitleText: userModel!.fullName),
                      AppListTile(
                        titleText: AppString.numberLabelText,
                        subTitleText: userModel!.number,
                      ),
                      AppListTile(
                          titleText: AppString.email,
                          subTitleText: userModel!.email),
                      AppListTile(
                          titleText: AppString.labelTextOfDateOfBirth,
                          subTitleText: userModel!.dateOfBirth),
                    ],
                  ),
          ]),
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
