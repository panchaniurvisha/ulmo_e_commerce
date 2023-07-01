import 'package:flutter/material.dart';

import '../res/commen/app_text.dart';
import '../res/constant/app_colors.dart';
import '../res/constant/app_string.dart';

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
          ListView.builder(
            itemBuilder: (context, index) => ListTile(
              leading: index == 0
                  ? const Icon(
                      Icons.shopping_bag_outlined,
                      color: AppColors.black,
                    )
                  : index == 1
                      ? const Icon(
                          Icons.person_sharp,
                          color: AppColors.black,
                        )
                      : index == 2
                          ? const Icon(
                              Icons.location_on_outlined,
                              color: AppColors.black,
                            )
                          : index == 3
                              ? const Icon(
                                  Icons.payment_outlined,
                                  color: AppColors.black,
                                )
                              : const Icon(
                                  Icons.logout,
                                  color: AppColors.black,
                                ),
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
