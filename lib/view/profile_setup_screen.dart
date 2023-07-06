import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulmo_e_commerce_app/res/common/app_elevated_button.dart';
import 'package:ulmo_e_commerce_app/res/common/app_text.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_images.dart';
import 'package:ulmo_e_commerce_app/view/account_screen.dart';

import '../res/common/app_text_form_field.dart';
import '../res/constant/app_colors.dart';
import '../res/constant/app_string.dart';
import '../utils/utils.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  XFile? image;
  File? cameraImage;
  double? download = 0;
  Utils utils = Utils();
  final ImagePicker picker = ImagePicker();

  String? imageUrl = ""; //fireStore database

  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  User? user;
  bool isSecurePassword = true;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Center(
            child: AppText(
          text: AppString.titleProfile,
          fontWeight: FontWeight.w500,
        )),
        actions: [
          Padding(
            padding: EdgeInsets.only(top: height / 60, right: width / 25),
            child: const AppText(
                text: AppString.skip, fontWeight: FontWeight.w500),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width / 20),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(width / 4),
                        child: cameraImage != null
                            ? Image.file(
                                cameraImage!,
                                height: height / 10,
                                width: width / 4.5,
                                fit: BoxFit.cover,
                              )
                            : Container(
                                decoration: const BoxDecoration(
                                  color: AppColors.whiteTwo,
                                  shape: BoxShape.circle,
                                ),
                                width: width / 3.5,
                                height: height / 10,
                                child: const Icon(
                                  Icons.camera_alt,
                                  color: AppColors.grayShadow800,
                                ),
                              )),
                    Container(
                      decoration: const BoxDecoration(
                        color: AppColors.grayWhite,
                        shape: BoxShape.circle,
                      ),
                      height: height / 20,
                      child: IconButton(
                        icon: Icon(
                          Icons.camera_alt,
                          size: height / 40,
                        ),
                        onPressed: () => showModalBottomSheet(
                          isDismissible: true,
                          context: context,
                          backgroundColor: Colors.transparent,
                          barrierColor: Colors.transparent,
                          builder: (context) => Container(
                            height: height / 5,
                            width: double.infinity,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                color: AppColors.lightBlack,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(width / 25),
                                  topRight: Radius.circular(width / 25),
                                )),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: height / 40,
                                  horizontal: width / 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const AppText(
                                      text: AppString.profilePhoto,
                                      color: AppColors.white),
                                  SizedBox(
                                    height: height / 50,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: AppColors.white12),
                                            shape: BoxShape.circle),
                                        child: IconButton(
                                          onPressed: () {
                                            pickImageFromCamera();
                                            Navigator.of(context).pop();
                                          },
                                          icon: const Icon(
                                              Icons.camera_alt_rounded,
                                              color: AppColors.white),
                                        ),
                                      ),
                                      SizedBox(
                                        width: width / 30,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: AppColors.white12),
                                            shape: BoxShape.circle),
                                        child: IconButton(
                                          onPressed: () {
                                            pickImageFromGallery();
                                            Navigator.of(context).pop();
                                          },
                                          icon: Padding(
                                            padding:
                                                EdgeInsets.all(width / 100),
                                            child: Image.asset(
                                                AppImages.galleryIcon),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const AppText(
                text: AppString.photoUpload,
                fontWeight: FontWeight.w500,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: height / 25),
                child: AppTextFormField(
                  controller: fullNameController,
                  validator: (value) =>
                      utils.isValidName(fullNameController.text)
                          ? null
                          : AppString.errorTitle,
                  labelText: AppString.labelTextOfName,
                  hintText: AppString.hintTextOfName,
                  keyboardType: TextInputType.name,
                ),
              ),
              AppTextFormField(
                  controller: phoneNumberController,
                  labelText: AppString.labelTextOfNumber,
                  hintText: AppString.hintTextOfPhoneNumber,
                  validator: (value) =>
                      utils.isValidMobile(phoneNumberController.text)
                          ? null
                          : AppString.errorNumberTitle,
                  keyboardType: TextInputType.phone),
              Padding(
                padding: EdgeInsets.symmetric(vertical: height / 25),
                child: AppTextFormField(
                  labelText: AppString.email,
                  hintText: AppString.hintEmailName,
                  controller: emailController,
                  validator: (value) => utils.isValidEmail(emailController.text)
                      ? null
                      : AppString.errorEmailTitle,
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
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
                    createUserData();
                    debugPrint("Next Account Screen====>");
                  }
                },
                text: AppString.save,
                sizeBox: const SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  pickImageFromCamera() async {
    image = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (image != null) {
        cameraImage = File(image!.path);
        storeImageInCloudStorage();
      } else {
        debugPrint("No image selected------->");
      }
    });
  }

  pickImageFromGallery() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        cameraImage = File(image!.path);
        storeImageInCloudStorage();
      } else {
        debugPrint("No image selected");
      }
    });
  }

  storeImageInCloudStorage() async {
    Reference referenceDirImages = firebaseStorage.ref().child("images");
    Reference referenceImageToUpload =
        referenceDirImages.child("uniqueFileName");
    try {
      await referenceImageToUpload.putFile(cameraImage!);
      imageUrl = await referenceImageToUpload.getDownloadURL();
    } on FirebaseException catch (e) {
      utils.showSnackBar(context, message: e.message);
    }
  }

  createUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    CollectionReference users = firebaseFireStore.collection('user');

    await users.doc().set({
      'full_name': fullNameController.text,
      'date_of_birth': dateOfBirthController.text,
      'number': phoneNumberController.text,
      'email': emailController.text,
      'image': imageUrl.toString(),
    }).then((value) {
      utils.showToastMessage(message: 'User is added');

      preferences.setString('fullName', fullNameController.text);
      preferences.setString('dateOfBirth', dateOfBirthController.text);
      preferences.setString('phoneNumber', phoneNumberController.text);
      preferences.setString('email', emailController.text);
      preferences.setString('imageUrl', imageUrl.toString());

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AccountScreen(),
        ),
      );
    }).catchError((error) {
      debugPrint('Failed to add user: $error');
    });
  }
}
