import 'package:flutter/material.dart';

import '../res/commen/app_text.dart';
import '../res/constant/app_string.dart';

class BegScreen extends StatefulWidget {
  const BegScreen({Key? key}) : super(key: key);

  @override
  State<BegScreen> createState() => _BegScreenState();
}

class _BegScreenState extends State<BegScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: height / 20, horizontal: width / 20),
          child: Column(
            children: [
              AppText(
                  text: AppString.bag,
                  fontWeight: FontWeight.w600,
                  fontSize: height / 30),
            ],
          ),
        ),
      ),
    );
  }
}
