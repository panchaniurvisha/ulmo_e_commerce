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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 28),
          child: Column(
            children: [
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
              FutureBuilder<Map<String, dynamic>>(
                future: getUser(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  if (snapshot.hasError) {
                    return const Text('Failed to fetch user data');
                  }
                  Map<String, dynamic>? userData = snapshot.data;
                  // Access the user data here and display it in your widget
                  // For example:
                  String fullName = userData?['fullName'] ?? '';
                  String phoneNumber = userData?['number'] ?? '';
                  String email = userData?["email"] ?? "";
                  String dateOfBirth = userData?["date_of_birth"] ?? "";
                  String image = userData?["image"] ?? "";

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      userData!.containsKey('image')
                          ? CircleAvatar(
                              radius: 30, backgroundImage: NetworkImage(image))
                          : const SizedBox(),
                      AppListTile(
                          titleText: AppString.nameLabelText,
                          subTitleText: fullName),
                      AppListTile(
                          titleText: AppString.numberLabelText,
                          subTitleText: phoneNumber),
                      AppListTile(
                          titleText: AppString.email, subTitleText: email),
                      AppListTile(
                          titleText: AppString.labelTextOfDateOfBirth,
                          subTitleText: dateOfBirth),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Map<String, dynamic>> getUser() async {
    CollectionReference users = firebaseFireStore.collection('user');
    DocumentSnapshot documentSnapshot =
        await users.doc(firebaseAuth.currentUser!.uid).get();
    Map<String, dynamic> userData =
        documentSnapshot.data() as Map<String, dynamic>;
    AccountModel userModel = AccountModel.fromJson(userData);
    return userData;
  }
}
