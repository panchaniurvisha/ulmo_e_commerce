import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulmo_e_commerce_app/view/address_book_screen.dart';
import 'package:ulmo_e_commerce_app/view/my_details_screen.dart';

import '../model/first_screen_model.dart';
import '../res/common/app_elevated_button.dart';
import '../res/common/app_text.dart';
import '../res/constant/app_colors.dart';
import '../res/constant/app_images.dart';
import '../res/constant/app_string.dart';
import '../utils/utils.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  List<String> data = [
    AppString.myOrder,
    AppString.myDetails,
    AppString.addressBook,
    AppString.paymentMethods,
    AppString.signOut
  ];
  final ImagePicker picker = ImagePicker();
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('user');
  late SharedPreferences sharedPreferences;

  AccountModel? userModel;
  User? user;
  XFile? image;
  File? cameraImage;
  String? imageUrl = "";
  Utils utils = Utils();
  bool isImageLoaded = false;

  @override
  void initState() {
    super.initState();
    getUser();
    initializeSharedPreferences();
  }

  void initializeSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
    loadImageFromSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.skyWhite,
      appBar: AppBar(
        backgroundColor: AppColors.skyWhite,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings_outlined,
                color: AppColors.black,
              )),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: width / 20),
            child: AppText(
                text: AppString.myAccount,
                fontWeight: FontWeight.w600,
                fontSize: height / 30),
          ),
          Row(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(width / 4),
                    child: isImageLoaded
                        ? userModel?.image != null
                            ? Image.network(
                                userModel!.image!,
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
                              )
                        : SizedBox(
                            width: width / 3.5,
                            height: height / 10,
                            child: const CircularProgressIndicator(),
                          ),
                  ),
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
                                vertical: height / 40, horizontal: width / 20),
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
                                          padding: EdgeInsets.all(width / 100),
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
              userModel == null
                  ? const CircularProgressIndicator()
                  : Padding(
                      padding: EdgeInsets.only(left: width / 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                              text: userModel!.fullName,
                              fontWeight: FontWeight.bold),
                          AppText(
                            text: "+${userModel!.number}",
                            color: AppColors.gray,
                          ),
                        ],
                      ),
                    ),
            ],
          ),
          ListView.builder(
            itemBuilder: (context, index) => ListTile(
              leading: index == 0
                  ? IconButton(
                      icon: const Icon(
                        Icons.shopping_bag_outlined,
                        color: AppColors.black,
                      ),
                      onPressed: () {},
                    )
                  : index == 1
                      ? IconButton(
                          icon: const Icon(
                            Icons.person_sharp,
                            color: AppColors.black,
                          ),
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyDetailsScreen())),
                        )
                      : index == 2
                          ? IconButton(
                              icon: const Icon(
                                Icons.location_on_outlined,
                                color: AppColors.black,
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AddressBookScreen())),
                            )
                          : index == 3
                              ? IconButton(
                                  icon: const Icon(
                                    Icons.payment_outlined,
                                    color: AppColors.black,
                                  ),
                                  onPressed: () {},
                                )
                              : IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Dialog(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                width / 10,
                                              ),
                                            ),
                                            child: Container(
                                              height: height / 2.5,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        height / 60),
                                                color: AppColors.skyWhite,
                                              ),
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.all(height / 50),
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: height / 40,
                                                    ),
                                                    AppText(
                                                      text:
                                                          AppString.sureSignOut,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: height / 40,
                                                    ),
                                                    AppText(
                                                      text:
                                                          AppString.notSignOut,
                                                      color: AppColors.gray,
                                                      fontSize: height / 50,
                                                    ),
                                                    SizedBox(
                                                      height: height / 40,
                                                    ),
                                                    AppElevatedButton(
                                                        sizeBox:
                                                            const SizedBox(),
                                                        text: AppString
                                                            .titleOfButton,
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context)),
                                                    SizedBox(
                                                      height: height / 50,
                                                    ),
                                                    AppElevatedButton(
                                                      color: AppColors.white,
                                                      sizeBox: const SizedBox(),
                                                      text: AppString
                                                          .signOutButton,
                                                      onPressed: () {
                                                        firebaseAuth.signOut();
                                                        Navigator.pop(context);
                                                      },
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        });
                                    // firebaseAuth.signOut();
                                  },
                                  icon: const Icon(
                                    Icons.logout,
                                    color: AppColors.black,
                                  )),
              title: AppText(
                text: data[index],
                fontWeight: FontWeight.w500,
              ),
            ),
            itemCount: data.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
          )
        ],
      ),
    );
  }

  pickImageFromCamera() async {
    image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      cameraImage = File(image!.path);
      await storeImageInCloudStorage();
      await sharedPreferences.setString('image', imageUrl.toString());
      setState(() {
        userModel?.image = imageUrl;
        isImageLoaded = true;
      });
    } else {
      debugPrint("No image selected------->");
    }
  }

  pickImageFromGallery() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      cameraImage = File(image!.path);
      await storeImageInCloudStorage();
      await sharedPreferences.setString('image', imageUrl.toString());
      setState(() {
        userModel?.image = imageUrl;
        isImageLoaded = true;
      });
    } else {
      debugPrint("No image selected");
    }
  }

  void loadImageFromSharedPreferences() {
    String? imageUrl = sharedPreferences.getString('image');
    if (imageUrl != null) {
      setState(() {
        userModel?.image = imageUrl;
        isImageLoaded = true;
      });
    }
  }

  storeImageInCloudStorage() async {
    Reference referenceDirImages = firebaseStorage.ref().child("images");
    Reference referenceImageToUpload =
        referenceDirImages.child("uniqueFileName");
    try {
      await referenceImageToUpload.putFile(cameraImage!);
      imageUrl = await referenceImageToUpload.getDownloadURL();

      // Save the image URL in SharedPreferences
      sharedPreferences.setString('image', imageUrl!);
    } on FirebaseException catch (e) {
      utils.showSnackBar(context, message: e.message);
    }
    createUserData();
  }

  createUserData() async {
    CollectionReference users = firebaseFireStore.collection('user');

    try {
      await users.doc(user!.uid).set(
        {
          'image': imageUrl.toString(),
        },
        SetOptions(merge: true),
      );
      utils.showToastMessage(message: 'User is added');
      await sharedPreferences.setString('image', imageUrl.toString());
    } catch (error) {
      debugPrint("Failed to add user: $error");
    }
  }

  getUser() {
    if (firebaseAuth.currentUser != null) {
      CollectionReference users = firebaseFireStore.collection("user");
      users.doc(firebaseAuth.currentUser!.uid).get().then((value) {
        debugPrint(
            "User Added successfully  --------> ${jsonEncode(value.data())}");
        userModel = accountModelFromJson(jsonEncode(value.data()));
        setState(() {});

        // Retrieve the image URL from SharedPreferences
        if (userModel != null) {
          String? imageUrl = sharedPreferences.getString('image');
          userModel!.image = imageUrl;
        }
      }).catchError((error) {
        debugPrint("Failed to get user  : $error");
      });
    }
  }
}
