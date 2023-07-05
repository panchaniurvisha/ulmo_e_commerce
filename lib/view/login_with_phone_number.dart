import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../res/common/app_elevated_button.dart';
import '../res/common/app_text.dart';
import '../res/common/row_app_bar.dart';
import '../res/constant/app_string.dart';
import 'otp_Scree.dart';

class LoginWithPhoneNumber extends StatefulWidget {
  const LoginWithPhoneNumber({
    Key? key,
  }) : super(key: key);
  static String verify = "";

  @override
  State<LoginWithPhoneNumber> createState() => _LoginWithPhoneNumberState();
}

class _LoginWithPhoneNumberState extends State<LoginWithPhoneNumber> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  var phone = "";
  User? user;
  TextEditingController countryCode = TextEditingController();

  @override
  void initState() {
    countryCode.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding:
            EdgeInsets.symmetric(vertical: height / 40, horizontal: width / 20),
        child: Column(
          children: [
            RowAppBar(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            Container(
              height: height / 14,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(width / 40)),
              child: Padding(
                padding: EdgeInsets.only(left: width / 30),
                child: Row(
                  children: [
                    SizedBox(
                        width: width / 12,
                        child: TextField(
                          controller: countryCode,
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                        )),
                    Text(
                      AppString.slash,
                      style:
                          TextStyle(fontSize: height / 40, color: Colors.grey),
                    ),
                    SizedBox(
                      width: width / 40,
                    ),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        onChanged: (value) {
                          phone = value;
                        },
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: AppString.hintTextOfPhone),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: height / 40),
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
      )),
    );
  }

  verifyPhoneNumber() async {
    await firebaseAuth.verifyPhoneNumber(
      phoneNumber: countryCode.text + phone,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        debugPrint("${e.message}");
      },
      codeSent: (String verificationId, int? resendToken) {
        LoginWithPhoneNumber.verify = verificationId;
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
