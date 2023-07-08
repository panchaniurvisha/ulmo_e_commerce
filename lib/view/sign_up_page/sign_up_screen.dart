import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/common/app_elevated_button.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_colors.dart';

import '../../res/common/app_text.dart';
import '../../res/common/app_text_form_field.dart';
import '../../res/constant/app_string.dart';
import '../../utils/utils.dart';
import '../login_page/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;

  User? user;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();

  bool value = false;
  bool isSecurePassword = true;
  final formKey = GlobalKey<FormState>();
  Utils utils = Utils();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: AppText(
            text: AppString.signupTitle,
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
              const AppText(text: AppString.fullName),
              AppTextFormField(
                controller: firstNameController,
                validator: (value) =>
                    utils.isValidName(firstNameController.text)
                        ? null
                        : AppString.errorTitle,
                labelText: AppString.fullName,
                hintText: AppString.hintTextName,
                keyboardType: TextInputType.name,
              ),
              const AppText(text: AppString.email),
              AppTextFormField(
                labelText: AppString.email,
                hintText: AppString.hintEmailName,
                controller: emailController,
                validator: (value) => utils.isValidEmail(emailController.text)
                    ? null
                    : AppString.errorEmailTitle,
                keyboardType: TextInputType.emailAddress,
              ),
              const AppText(text: AppString.password),
              AppTextFormField(
                  suffixIcon: IconButton(
                    icon: Icon(isSecurePassword
                        ? Icons.visibility_off
                        : Icons.visibility),
                    iconSize: 20,
                    color: const Color(0xff200E32),
                    onPressed: () {
                      setState(() {
                        isSecurePassword = !isSecurePassword;
                      });
                    },
                  ),
                  labelText: AppString.password,
                  hintText: AppString.hintTextPassword,
                  controller: passwordController,
                  obscureText: isSecurePassword,
                  textInputAction: TextInputAction.done,
                  validator: (value) =>
                      utils.isValidPassword(passwordController.text)
                          ? null
                          : AppString.errorPasswordTitle,
                  keyboardType: TextInputType.visiblePassword),
              const AppText(text: AppString.mobileNo),
              AppTextFormField(
                  controller: phoneNumberController,
                  labelText: AppString.number,
                  hintText: AppString.hintTextNumber,
                  validator: (value) =>
                      utils.isValidMobile(phoneNumberController.text)
                          ? null
                          : AppString.errorNumberTitle,
                  keyboardType: TextInputType.phone),
              const AppText(text: AppString.dateOfBirth),
              AppTextFormField(
                  controller: dateOfBirthController,
                  labelText: AppString.labelTextOfDateOfBirth,
                  hintText: AppString.hintTextOfDateOfBirth,
                  validator: (value) =>
                      utils.isValidDateOfBirth(dateOfBirthController.text)
                          ? null
                          : AppString.errorNumberTitle,
                  keyboardType: TextInputType.name),
              SizedBox(
                height: height / 10,
              ),
              AppElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    createUser();
                    debugPrint("Next Login Screen====>");
                  }
                },
                text: AppString.signup,
                sizeBox: const SizedBox(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(AppString.createAccount),
                  TextButton(
                    child: const Text(
                      AppString.login,
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.redColor,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                          (route) => false);
                      //signup screen
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///----EMAIL SHOW IN AUTH
  createUser() async {
    try {
      await firebaseAuth
          .createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      )
          .then((value) {
        debugPrint("Value==>${value.user}");
        user = value.user;
        user!.sendEmailVerification();
        createUserData();
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.---->');
        utils.showSnackBar(context,
            message: "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
        utils.showSnackBar(context,
            message: "The account already exists for that email.");
      }
    } catch (e) {
      debugPrint("Error===>$e");
    }
  }

  ///------DATA SHOW IN  FIRESTORE DATABASE
  createUserData() {
    CollectionReference users = firebaseFireStore.collection('user');
    users.doc(user!.uid).set({
      'id': user!.uid, // John Doe
      'fullName': firstNameController.text, // Stokes and Sons
      "number": phoneNumberController.text,
      "email": user!.email,
      'date_of_birth': dateOfBirthController.text, // 42
    }).then((value) {
      utils.showToastMessage(
          message: " SignUp is complete,Please verify your email");
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
          (route) => false);
    }).catchError((error) {
      debugPrint("Failed to add user: $error");
    });
  }
}
