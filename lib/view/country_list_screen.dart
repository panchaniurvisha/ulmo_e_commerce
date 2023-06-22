import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ulmo_e_commerce_app/res/commen/app_elevated_button.dart';
import 'package:ulmo_e_commerce_app/res/commen/app_text.dart';
import 'package:ulmo_e_commerce_app/res/commen/row_app_bar.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_colors.dart';

import '../res/constant/app_string.dart';

class CountryListScreen extends StatefulWidget {
  const CountryListScreen({Key? key}) : super(key: key);

  @override
  State<CountryListScreen> createState() => _CountryListScreenState();
}

class _CountryListScreenState extends State<CountryListScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(width / 40),
          child: Column(
            children: [
              RowAppBar(
                text: AppString.actionOfHelp,
                width: width / 10,
              ),
              AppText(text: AppString.enterNumber, fontSize: height / 30, fontWeight: FontWeight.w600),
              SizedBox(
                height: height / 30,
              ),
              IntlPhoneField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: AppString.labelTextOfPhone,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(width / 35),
                        borderSide: BorderSide(color: AppColors.white, width: width / 10),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(width / 35),
                        borderSide: const BorderSide(),
                      )),
                  initialCountryCode: "IN",
                  onChanged: (phone) {}),
              const Spacer(),
              const AppElevatedButton(
                text: AppString.buttonOfContinue,
                sizeBox: SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
