import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ulmo_e_commerce_app/res/common/app_elevated_button.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_images.dart';

import '../../model/first_screen_model.dart';
import '../../res/common/app_text.dart';
import '../../res/common/app_text_form_field.dart';
import '../../res/constant/app_colors.dart';
import '../../res/constant/app_string.dart';
import '../../utils/utils.dart';
import '../home/home_screen.dart';
import '../sign_up_page/sign_up_screen.dart';
import 'forgot_password_page.dart';
import 'login_with_phone_number.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;

  User? userData;
  UserCredential? userCredential;
  Utils utils = Utils();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool value = false;
  bool isSecurePassword = true;
  final formKey = GlobalKey<FormState>();
  AccountModel? userModel;

  @override
  void initState() {
    // TODO: implement initState

    //user=FirebaseAuth.instance.currentUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: AppText(
            text: AppString.loginTitle,
            fontWeight: FontWeight.bold,
            fontSize: height / 40),
        backgroundColor: AppColors.white,
        elevation: 0,
      ),
      body: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding: EdgeInsets.all(height / 45),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const AppText(text: AppString.email),
                AppTextFormField(
                    labelText: AppString.email,
                    hintText: AppString.hintEmailName,
                    controller: emailController,
                    validator: (value) =>
                        utils.isValidEmail(emailController.text)
                            ? null
                            : AppString.errorEmailTitle,
                    keyboardType: TextInputType.emailAddress),
                const AppText(text: AppString.password),
                AppTextFormField(
                    suffixIcon: IconButton(
                      icon: Icon(isSecurePassword
                          ? Icons.visibility_off
                          : Icons.visibility),
                      iconSize: height / 40,
                      color: const Color(0xff200E32),
                      onPressed: () {
                        setState(() {
                          isSecurePassword = !isSecurePassword;
                        });
                      },
                    ),
                    textInputAction: TextInputAction.done,
                    labelText: AppString.password,
                    hintText: AppString.hintTextPassword,
                    controller: passwordController,
                    obscureText: isSecurePassword,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) =>
                        utils.isValidPassword(passwordController.text)
                            ? null
                            : AppString.errorPasswordTitle),
                Center(
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const ForgotPasswordPage()));
                      },
                      child: AppText(
                          text: AppString.forgetPassword,
                          color: AppColors.redColor,
                          fontSize: height / 60,
                          fontWeight: FontWeight.bold)),
                ),
                AppElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      loginUser();
                      debugPrint("Second Screen!!!!!!!!!!!---->");
                    }
                  },
                  text: AppString.login,
                  sizeBox: const SizedBox(),
                ),
                const Align(
                    alignment: Alignment.center,
                    child: AppText(text: AppString.or)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        signInWithGoogle();
                      },
                      icon: Image.asset(
                        AppImages.googleLogo,
                        height: height / 20,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const LoginWithPhoneNumber(),
                            ));
                      },
                      icon: Image.asset(
                        AppImages.phoneLogo,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                        text: AppString.doNotHaveAccount,
                        fontSize: height / 60),
                    TextButton(
                      child: const AppText(
                        text: AppString.signup,
                        color: AppColors.redColor,
                        fontWeight: FontWeight.bold,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ));
                        //signup screen
                      },
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }

  ///-------CHECK EMAIL IN FIREBASEAUTH--------->>>
  loginUser() async {
    try {
      await firebaseAuth
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) {
        debugPrint("Value=========>${value.user}");
        if (value.user!.emailVerified) {
          debugPrint("User is Login....");
          userData = value.user;
          getUser();
        } else {
          debugPrint("Please verify the email");
          utils.showSnackBar(
            context,
            message: "Please verify the email",
            label: "Resent",
            onPressed: () => value.user!.sendEmailVerification(),
          );
        }
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
      }
    }
  }

  ///------DATA STORE IN MODEL FROM  FIRESTORE DATABASE--------->>>
  getUser() {
    CollectionReference users = firebaseFireStore.collection('user');
    users.doc(userData!.uid).get().then((value) {
      debugPrint("User Added---->${jsonEncode(value.data())}");
      userModel = accountModelFromJson(jsonEncode(value.data()));
      utils.showToastMessage(message: "Login is successfully");
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (route) => false);
    }).catchError((error) {
      debugPrint("Failed to add user: $error");
    });
  }

  ///------SignInWithGoogle And Show Authentication--------->>>
  Future<void> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    debugPrint("googleUser----->$googleUser");

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    userCredential = await firebaseAuth.signInWithCredential(credential);
    userData = userCredential!.user;
    debugPrint("userdata-->$userData");
    utils.showToastMessage(message: "Login is Successfully");
  }
}
