import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/commen/app_text.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_string.dart';

import '../res/constant/app_colors.dart';

class MyDetailsScreen extends StatefulWidget {
  const MyDetailsScreen({Key? key}) : super(key: key);

  @override
  State<MyDetailsScreen> createState() => _MyDetailsScreenState();
}

class _MyDetailsScreenState extends State<MyDetailsScreen> {
  CollectionReference users = FirebaseFirestore.instance.collection('user');

  List<Map> listOfDetails = [
    {
      AppString.key: AppString.labelTextOfName,
      // AppString.name: data["full_name"]
    },
    {
      AppString.key: AppString.numberLabelText,
      // AppString.name: data["full_name"]
    },
    {
      AppString.key: AppString.email,
      // AppString.name: data["full_name"]
    },
    {
      AppString.key: AppString.labelTextOfDateOfBirth,
      // AppString.name: data["full_name"]
    },
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
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
                AppText(
                  text: AppString.titleOFDetails,
                  fontWeight: FontWeight.w500,
                ),
                AppText(
                  text: AppString.save,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            FutureBuilder<QuerySnapshot>(
              future: users.get(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting ||
                    snapshot.connectionState == ConnectionState.active) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return const Center(child: Text("Something went wrong"));
                }

                if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text("Document does not exist"));
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  debugPrint("snapshot.data!.docs====>${snapshot.data!.docs}");

                  return SizedBox(
                    height: height / 10,
                    child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> data = snapshot.data!.docs[index]
                            .data() as Map<String, dynamic>;
                        return Column(
                          children: [
                            data.containsKey("image")
                                ? CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(
                                      data["image"],
                                    ),
                                  )
                                : const SizedBox(),
                            ListTile(
                              title: Text(listOfDetails[index][AppString.key],
                                  style:
                                      const TextStyle(color: AppColors.gray)),
                              subtitle: Text(data["full_name"]),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                }
                return const Text("loading");
              },
            ),
          ],
        ),
      ),
    );
  }
}
