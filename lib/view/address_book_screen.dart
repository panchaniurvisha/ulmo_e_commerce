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
                    String country = userData?['country'] ?? '';
                    String city = userData?['city'] ?? '';
                    String postCode = userData?["postCode"] ?? "";
                    String street = userData?['street'] ?? '';
                    String phoneNumber = userData?['number'] ?? '';

                    return Row(children: [
                      Icon(Icons.location_on_outlined, size: height / 22),
                      Padding(
                        padding: EdgeInsets.only(left: width / 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                AppText(text: country),
                                AppText(text: city),
                                AppText(text: street)
                              ],
                            ),
                            Row(
                              children: [
                                AppText(
                                    text: phoneNumber,
                                    color: AppColors.gray,
                                    fontSize: height / 60),
                                AppText(
                                    text: ",PostCode :$postCode,",
                                    color: AppColors.gray,
                                    fontSize: height / 60),
                              ],
                            )
                          ],
                        ),
                      )
                    ]);
                  }),
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
