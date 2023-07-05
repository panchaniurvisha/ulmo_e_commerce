import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulmo_e_commerce_app/res/common/app_list_tile.dart';
import 'package:ulmo_e_commerce_app/res/common/app_text.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_string.dart';

import '../res/constant/app_colors.dart';
import '../res/constant/app_images.dart';
import '../utils/utils.dart';
import 'account_screen.dart';

class MyDetailsScreen extends StatefulWidget {
  const MyDetailsScreen({Key? key}) : super(key: key);

  @override
  State<MyDetailsScreen> createState() => _MyDetailsScreenState();
}

class _MyDetailsScreenState extends State<MyDetailsScreen> {
  CollectionReference users = FirebaseFirestore.instance.collection('user');
  final picker = ImagePicker();

  XFile? image;
  File? cameraImage;

  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;
  Utils utils = Utils();
  String? imageUrl = "";

  Future<Map<String, dynamic>> retrieveStoredUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? fullName = preferences.getString('fullName');
    String? dateOfBirth = preferences.getString('dateOfBirth');
    String? phoneNumber = preferences.getString('phoneNumber');
    String? email = preferences.getString('email');
    String? imageUrl = preferences.getString('imageUrl');

    Map<String, dynamic> userData = {
      'full_name': fullName,
      'date_of_birth': dateOfBirth,
      'number': phoneNumber,
      'email': email,
      'image': imageUrl,
    };
    return userData;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 28),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    padding: EdgeInsets.only(right: width / 10),
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                  ),
                  const AppText(
                    text: AppString.titleOFDetails,
                    fontWeight: FontWeight.w500,
                  ),
                  InkWell(
                    onTap: () => createUserData(),
                    child: const AppText(
                      text: AppString.save,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              FutureBuilder<Map<String, dynamic>>(
                future: retrieveStoredUserData(),
                builder: (BuildContext context,
                    AsyncSnapshot<Map<String, dynamic>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return const Center(child: Text('Something went wrong'));
                  }

                  Map<String, dynamic>? userData = snapshot.data;

                  if (userData == null || userData.isEmpty) {
                    return const Center(child: Text('User data not found'));
                  }

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      userData.containsKey('image')
                          ? CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  NetworkImage(userData['image'] as String),
                            )
                          : const SizedBox(),
                      TextButton(
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                  changePhotoFromCamera();
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
                                                  changePhotoFromGallery();
                                                  Navigator.of(context).pop();
                                                },
                                                icon: Padding(
                                                  padding: EdgeInsets.all(
                                                      width / 100),
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
                          child: const AppText(
                            text: AppString.changePhoto,
                            fontWeight: FontWeight.w500,
                          )),
                      AppListTile(
                        titleText: AppString.labelTextOfName,
                        subTitleText: userData['full_name'] as String,
                      ),
                      AppListTile(
                        titleText: AppString.numberLabelText,
                        subTitleText: userData['number'] as String,
                      ),
                      AppListTile(
                        titleText: AppString.email,
                        subTitleText: userData['email'] as String,
                      ),
                      AppListTile(
                        titleText: AppString.labelTextOfDateOfBirth,
                        subTitleText: userData['date_of_birth'] as String,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  changePhotoFromGallery() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        cameraImage = File(image!.path);
        storeImageInCloudStorage();
      } else {
        debugPrint("No image selected------->");
      }
    });
  }

  changePhotoFromCamera() async {
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
      'image': imageUrl.toString(),
    }).then((value) {
      utils.showToastMessage(message: 'User is added');

      // Save the imageUrl in SharedPreferences
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
