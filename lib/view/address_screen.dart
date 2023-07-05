import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulmo_e_commerce_app/res/common/app_list_tile.dart';
import 'package:ulmo_e_commerce_app/res/common/app_text.dart';

import '../res/common/row_app_bar.dart';
import '../res/constant/app_string.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  Future<Map<String, dynamic>> retrieveStoredUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? fullName = preferences.getString('fullName');
    String? phoneNumber = preferences.getString('phoneNumber');
    String? email = preferences.getString('email');

    Map<String, dynamic> userData = {
      'full_name': fullName,
      'number': phoneNumber,
      'email': email,
    };
    return userData;
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
            physics: const AlwaysScrollableScrollPhysics(),
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

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppListTile(
                          titleText: AppString.labelTextOfName,
                          subTitleText: userData['full_name'] as String,
                        ),
                        AppListTile(
                          titleText: AppString.numberLabelText,
                          subTitleText: userData['number'] as String,
                        ),
                        AppListTile(
                          titleText: AppString.email,
                          subTitleText: userData['email'] as String,
                        ),
                      ],
                    );
                  },
                ),
                AppText(
                  text: AppString.addressInfo,
                  fontWeight: FontWeight.w600,
                  fontSize: height / 35,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
