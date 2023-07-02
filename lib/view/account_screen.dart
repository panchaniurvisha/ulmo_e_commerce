import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../model/first_screen_model.dart';
import '../res/constant/app_colors.dart';
import '../res/constant/app_string.dart';

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
  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  ProfileSetModel? userModel;
  CollectionReference users = FirebaseFirestore.instance.collection('user');

  @override
  void initState() {
    // TODO: implement initState
    //getUser();
    super.initState();
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
      body: FutureBuilder<QuerySnapshot>(
        future: users.get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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

            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> data =
                    snapshot.data!.docs[index].data() as Map<String, dynamic>;
                return ListTile(
                  title: Text(data["full_name"]),
                  subtitle: Text(data["number"]),
                );
              },
            );
          }
          return const Text("loading");
        },
      ),
      /*Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: width / 20),
            child: AppText(
                text: AppString.myAccount,
                fontWeight: FontWeight.w600,
                fontSize: height / 30),
          ),
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(height / 10),
              //child: Image.asset("${userModel!.image}"),
            ),
            title: AppText(
              text: "${userModel!.fullName}",
            ),
            subtitle: AppText(text: "${userModel!.number}"),
          ),
          ListView.builder(
            itemBuilder: (context, index) => ListTile(
              leading: index == 0
                  ? const Icon(
                      Icons.shopping_bag_outlined,
                      color: AppColors.black,
                    )
                  : index == 1
                      ? IconButton(
                          icon: const Icon(
                            Icons.person_sharp,
                            color: AppColors.black,
                          ),
                          onPressed: () => MaterialPageRoute(
                              builder: (context) => MyDetailsScreen()))
                      : index == 2
                          ? const Icon(
                              Icons.location_on_outlined,
                              color: AppColors.black,
                            )
                          : index == 3
                              ? const Icon(
                                  Icons.payment_outlined,
                                  color: AppColors.black,
                                )
                              : IconButton(
                                  onPressed: () {
                                    firebaseAuth.signOut();
                                  },
                                  icon: const Icon(Icons.logout)),
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
      ),*/
    );
  }
}
