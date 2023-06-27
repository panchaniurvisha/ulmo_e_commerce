import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../res/constant/app_string.dart';
import 'phone_login_screen.dart';
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

    return Scaffold(
      appBar: AppBar(
        actions: const [
          Text(AppString.helpText),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 25,
              ),
              const Text(
                AppString.phoneVerification,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(AppString.name,
                  style: TextStyle(fontSize: 16), textAlign: TextAlign.center),
              const SizedBox(
                height: 30,
              ),
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
                height: 20,
              ),
              SizedBox(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    verifyOtp();
                    debugPrint("Home Screen-------->");
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text(AppString.verify),
                ),
              ),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PhoneLoginScreen(),
                            ),
                            (route) => false);
                      },
                      child: const Text(
                        AppString.editPhoneNumber,
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  verifyOtp() {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: PhoneLoginScreen.verify, smsCode: code);
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
