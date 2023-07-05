import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulmo_e_commerce_app/view/address_book_screen.dart';

import '../model/first_screen_model.dart';
import '../res/common/app_text.dart';
import '../res/constant/app_colors.dart';
import '../res/constant/app_string.dart';
import 'my_details_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  List<String> data = [
    AppString.myOrder,
    AppString.myDetails,
    AppString.addressBook,
    AppString.paymentMethods,
    AppString.signOut
  ];
  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  ProfileSetModel? userModel;
  CollectionReference users = FirebaseFirestore.instance.collection('user');

  @override
  void initState() {
    // TODO: implement initState
    //getUser();
    super.initState();
  }

  Future<Map<String, dynamic>> retrieveStoredUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? fullName = preferences.getString('fullName');
    String? dateOfBirth = preferences.getString('dateOfBirth');
    String? phoneNumber = preferences.getString('phoneNumber');
    String? email = preferences.getString('email');
    String? imageUrl = preferences.getString('imageUrl');

    Map<String, dynamic> userData = {
      'full_name': fullName,
      'date_of_birth': dateOfBirth,
      'number': phoneNumber,
      'email': email,
      'image': imageUrl,
    };
    return userData;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.skyWhite,
      appBar: AppBar(
        backgroundColor: AppColors.skyWhite,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings_outlined,
                color: AppColors.black,
              )),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: width / 20),
            child: AppText(
                text: AppString.myAccount,
                fontWeight: FontWeight.w600,
                fontSize: height / 30),
          ),
          FutureBuilder<Map<String, dynamic>>(
            future: retrieveStoredUserData(),
            builder: (BuildContext context,
                AsyncSnapshot<Map<String, dynamic>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return const Center(child: Text('Something went wrong'));
              }

              Map<String, dynamic>? userData = snapshot.data;

              if (userData == null || userData.isEmpty) {
                return const Center(child: Text('User data not found'));
              }

              return SizedBox(
                height: height / 10,
                child: ListView(
                  children: [
                    ListTile(
                      leading: userData.containsKey('image')
                          ? CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  NetworkImage(userData['image'] as String),
                            )
                          : const SizedBox(),
                      title: Text(userData['full_name'] as String),
                      subtitle: Text(
                        userData['number'] as String,
                        style: const TextStyle(color: AppColors.gray),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          ListView.builder(
            itemBuilder: (context, index) => ListTile(
              leading: index == 0
                  ? IconButton(
                      icon: const Icon(
                        Icons.shopping_bag_outlined,
                        color: AppColors.black,
                      ),
                      onPressed: () {},
                    )
                  : index == 1
                      ? IconButton(
                          icon: const Icon(
                            Icons.person_sharp,
                            color: AppColors.black,
                          ),
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MyDetailsScreen())),
                        )
                      : index == 2
                          ? IconButton(
                              icon: const Icon(
                                Icons.location_on_outlined,
                                color: AppColors.black,
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AddressBookScreen())),
                            )
                          : index == 3
                              ? IconButton(
                                  icon: const Icon(
                                    Icons.payment_outlined,
                                    color: AppColors.black,
                                  ),
                                  onPressed: () {},
                                )
                              : IconButton(
                                  onPressed: () {
                                    firebaseAuth.signOut();
                                  },
                                  icon: const Icon(
                                    Icons.logout,
                                    color: AppColors.black,
                                  )),
              title: AppText(
                text: data[index],
                fontWeight: FontWeight.w500,
              ),
            ),
            itemCount: data.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
          )
        ],
      ),
    );
  }
}
