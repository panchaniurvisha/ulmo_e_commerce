import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/common/row_app_bar.dart';

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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const RowAppBar(
              text: AppString.titleOfScreen,
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
    );
  }
}
