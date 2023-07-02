import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/commen/app_text.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_string.dart';

class MyDetailsScreen extends StatefulWidget {
  const MyDetailsScreen({Key? key}) : super(key: key);

  @override
  State<MyDetailsScreen> createState() => _MyDetailsScreenState();
}

class _MyDetailsScreenState extends State<MyDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: const AppText(
          text: AppString.titleOFDetails,
        ),
        actions: const [
          AppText(
            text: AppString.save,
          ),
        ],
      ),
    );
  }
}
