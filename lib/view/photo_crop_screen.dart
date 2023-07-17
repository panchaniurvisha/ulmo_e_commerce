import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cropperx/cropperx.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/first_screen_model.dart';
import '../utils/utils.dart';
import 'account_screen.dart';

class PhotoCropScreen extends StatefulWidget {
  final Uint8List imageBytes;
  const PhotoCropScreen({
    super.key,
    required this.imageBytes,
  });

  @override
  State<PhotoCropScreen> createState() => _PhotoCropScreenState();
}

class _PhotoCropScreenState extends State<PhotoCropScreen> {
  OverlayType overlayType = OverlayType.circle;
  int rotationTurns = 0;
  Uint8List? imageToCrop;
  Uint8List? croppedImage;
  final GlobalKey cropperKey = GlobalKey(debugLabel: 'cropperKey');

  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('user');
  late SharedPreferences sharedPreferences;

  AccountModel? userModel;
  User? user;
  XFile? image;
  String? imageUrl = "";
  Utils utils = Utils();
  bool isImageLoaded = false;
  @override
  void initState() {
    // TODO: implement initState=

    super.initState();
    imageToCrop = widget.imageBytes;
    initializeSharedPreferences();
  }

  void initializeSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
    loadImageFromSharedPreferences();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 500,
            child: imageToCrop != null
                ? Cropper(
                    cropperKey: cropperKey,
                    overlayType: overlayType,
                    rotationTurns: rotationTurns,
                    image: Image.memory(imageToCrop!),
                    onScaleStart: (details) {
                      // todo: define started action.
                    },
                    onScaleUpdate: (details) {
                      // todo: define updated action.
                    },
                    onScaleEnd: (details) {
                      // todo: define ended action.
                    },
                  )
                : const ColoredBox(color: Colors.grey),
          ),
          Wrap(
            spacing: 16,
            children: [
              ElevatedButton(
                child: const Text('Switch overlay'),
                onPressed: () {
                  setState(() {
                    overlayType = overlayType == OverlayType.circle
                        ? OverlayType.grid
                        : overlayType == OverlayType.grid
                            ? OverlayType.rectangle
                            : OverlayType.circle;
                  });
                },
              ),
              ElevatedButton(
                child: const Text('Crop image'),
                onPressed: () async {
                  final imageBytes = await Cropper.crop(
                    cropperKey: cropperKey,
                  );

                  if (imageBytes != null) {
                    setState(() {
                      croppedImage = imageBytes;
                    });
                  }
                  getUser();
                },
              ),
              ElevatedButton(
                child: const Text('save image'),
                onPressed: () async {
                  await storeImageInCloudStorage();
                  await sharedPreferences.setString(
                      'image', imageUrl.toString());
                  setState(() {
                    userModel?.image = imageUrl;
                    isImageLoaded = true;
                  });
                },
              ),
              IconButton(
                onPressed: () {
                  setState(() => rotationTurns--);
                },
                icon: const Icon(Icons.rotate_left),
              ),
              IconButton(
                onPressed: () {
                  setState(() => rotationTurns++);
                },
                icon: const Icon(Icons.rotate_right),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (croppedImage != null)
            Padding(
              padding: const EdgeInsets.all(36.0),
              child: Image.memory(croppedImage!),
            ),
        ],
      ),
    ));
  }

  storeImageInCloudStorage() async {
    Reference referenceDirImages = firebaseStorage.ref().child("images");
    Reference referenceImageToUpload =
        referenceDirImages.child("uniqueFileName");
    try {
      await referenceImageToUpload.putData(imageToCrop!);
      imageUrl = await referenceImageToUpload.getDownloadURL();

      // Save the image URL in SharedPreferences
      sharedPreferences.setString('image', imageUrl!);
    } on FirebaseException catch (e) {
      utils.showSnackBar(context, message: e.message);
    }
    createUserData();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => AccountScreen(),
      ),
    );
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
