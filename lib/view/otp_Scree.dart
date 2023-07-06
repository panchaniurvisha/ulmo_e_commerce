import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:ulmo_e_commerce_app/res/common/app_elevated_button.dart';
import 'package:ulmo_e_commerce_app/res/common/row_app_bar.dart';

import '../res/common/app_text.dart';
import '../res/constant/app_string.dart';
import 'login_page/login_with_phone_number.dart';
import 'profile_setup_screen.dart';

class OtpScreen extends StatefulWidget {
  final String? phone;
  const OtpScreen({Key? key, this.phone}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  var code = "";
  String? verificationCode;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  TextEditingController pinPutController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final defaultPinTheme = PinTheme(
        width: 56,
        height: 56,
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Color.fromRGBO(30, 60, 87, 1),
        ),
        decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromRGBO(234, 239, 243, 1),
            ),
            borderRadius: BorderRadius.circular(20)));

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
        border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
        borderRadius: BorderRadius.circular(8));
    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration
          ?.copyWith(color: const Color.fromRGBO(234, 239, 243, 1)),
    );

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: height / 40, horizontal: width / 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const RowAppBar(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                text: AppString.helpText,
              ),
              AppText(
                  text: AppString.otpTitle,
                  fontSize: height / 30,
                  fontWeight: FontWeight.w600),
              Pinput(
                length: 6,
                showCursor: true,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                onChanged: (value) {
                  code = value;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              AppElevatedButton(
                onPressed: () {
                  verifyOtp();
                  debugPrint("Otp Screen-------->");
                },
                text: AppString.verify,
                sizeBox: const SizedBox(),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginWithPhoneNumber(),
                        ),
                        (route) => false);
                  },
                  child: const Text(
                    AppString.editPhoneNumber,
                    style: TextStyle(color: Colors.black),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  verifyOtp() {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: LoginWithPhoneNumber.verify, smsCode: code);
      firebaseAuth.signInWithCredential(credential);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const ProfileSetupScreen(),
          ),
          (route) => false);
    } catch (e) {
      debugPrint("Wrong Otp");
    }
  }
}
