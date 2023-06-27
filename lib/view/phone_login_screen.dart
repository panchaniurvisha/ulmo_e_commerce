import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ulmo_e_commerce_app/res/commen/app_elevated_button.dart';
import 'package:ulmo_e_commerce_app/res/commen/app_text.dart';
import 'package:ulmo_e_commerce_app/res/commen/row_app_bar.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_colors.dart';

import '../res/constant/app_string.dart';
import 'otp_Scree.dart';

class PhoneLoginScreen extends StatefulWidget {
  const PhoneLoginScreen({Key? key}) : super(key: key);
  static String verify = "";
  @override
  State<PhoneLoginScreen> createState() => _PhoneLoginScreenState();
}

class _PhoneLoginScreenState extends State<PhoneLoginScreen> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  var phone = "";

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
                mainAxisAlignment: MainAxisAlignment.center,
                text: AppString.actionOfHelp,
                width: width / 10,
              ),
              AppText(
                  text: AppString.enterNumber,
                  fontSize: height / 30,
                  fontWeight: FontWeight.w600),
              SizedBox(
                height: height / 30,
              ),
              IntlPhoneField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: AppString.hintTextOfPhone,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(width / 35),
                        borderSide: BorderSide(
                            color: AppColors.white, width: width / 10),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(width / 35),
                        borderSide: const BorderSide(),
                      )),
                  initialCountryCode: "IN",
                  onChanged: (phone) {}),
              const Spacer(),
              AppElevatedButton(
                onPressed: () {
                  verifyPhoneNumber();
                  debugPrint("Otp Screen!!!!!!!!!!!---->");
                },
                text: AppString.buttonOfContinue,
                sizeBox: const SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  verifyPhoneNumber() async {
    await firebaseAuth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        debugPrint("${e.message}");
      },
      codeSent: (String verificationId, int? resendToken) {
        PhoneLoginScreen.verify = verificationId;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const OtpScreen(),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
