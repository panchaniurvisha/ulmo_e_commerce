import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ulmo_e_commerce_app/view/address_book_screen.dart';

import '../model/first_screen_model.dart';
import '../res/common/app_text.dart';
import '../res/constant/app_colors.dart';
import '../res/constant/app_images.dart';
import '../res/constant/app_string.dart';
import '../utils/utils.dart';
import 'my_details_screen.dart';

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
  AccountModel? userModel;
  User? user;
  XFile? image;
  File? cameraImage;
  String? imageUrl = "";
  Utils utils = Utils();
  CollectionReference users = FirebaseFirestore.instance.collection('user');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = firebaseAuth.currentUser;
    if (user != null) {
      getUser();
    }
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
          FutureBuilder<Map<String, dynamic>>(
            future: getUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              if (snapshot.hasError) {
                return const Text('Failed to fetch user data');
              }
              Map<String, dynamic>? userData = snapshot.data;
              // Access the user data here and display it in your widget
              // For example:
              String firstName = userData?['fullName'] ?? '';
              String phoneNumber = userData?['number'] ?? '';

              return Row(
                children: [
                  Stack(
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(text: firstName, fontWeight: FontWeight.bold),
                      AppText(
                        text: '$phoneNumber,',
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ],
              );
            },
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
                          onPressed: () {
                            createUserData();
                            debugPrint("My Details Screen====>");
                          },
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
                                    firebaseAuth.signOut();
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

  createUserData() {
    CollectionReference users = firebaseFireStore.collection('user');
    users.doc(user!.uid).set(
      {
        'image': imageUrl.toString(),
      },
      SetOptions(merge: true),
    ).then((value) {
      utils.showToastMessage(message: 'User is added');
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MyDetailsScreen(),
          ));
    }).catchError((error) {
      debugPrint("Failed to add user: $error");
    });
  }

  Future<Map<String, dynamic>> getUser() async {
    CollectionReference users = firebaseFireStore.collection('user');
    DocumentSnapshot documentSnapshot =
        await users.doc(firebaseAuth.currentUser!.uid).get();
    Map<String, dynamic> userData =
        documentSnapshot.data() as Map<String, dynamic>;
    AccountModel userModel = AccountModel.fromJson(userData);
    return userData;
  }
}
