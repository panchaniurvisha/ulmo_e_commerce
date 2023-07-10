import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/common/app_text.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_colors.dart';

import '../model/first_screen_model.dart';
import '../res/common/row_app_bar.dart';
import '../res/constant/app_string.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  List<Map> data = [
    {AppString.key: AppString.deliverTo, AppString.name: ""},
    {
      AppString.key: AppString.currency,
      AppString.name: AppString.$usd,
    },
    {AppString.key: AppString.notifications, AppString.name: ""},
    {AppString.key: AppString.termsAndConditions, AppString.name: ""}
  ];
  bool switchValue = false;
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
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const RowAppBar(
              text: AppString.settings,
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
                  return ListView.builder(
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: height / 40, horizontal: width / 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(text: data[index][AppString.key]),
                          index == 0
                              ? AppText(text: country)
                              : index == 1
                                  ? AppText(text: data[index][AppString.name])
                                  : index == 2
                                      ? CupertinoSwitch(
                                          value: switchValue,
                                          trackColor: AppColors.white,
                                          activeColor: AppColors.grayWhite,
                                          thumbColor: AppColors.skyWhite70,
                                          onChanged: (value) {
                                            debugPrint("value---->$value");

                                            switchValue = value;
                                            setState(() {});
                                          },
                                        )
                                      : const SizedBox()
                        ],
                      ),
                    ),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: data.length,
                  );
                })
          ],
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
