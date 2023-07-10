import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_colors.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  AppTextField({Key? key, this.controller, this.labelText}) : super(key: key);
  final TextEditingController referralCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height / 60),
      child: TextField(
        autofocus: true,
        // maxLength: 8,
        controller: controller,
        decoration: InputDecoration(
            counter: Container(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Color(0xffE1E3E6)),
              borderRadius: BorderRadius.all(
                Radius.circular(width / 30),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.blue),
              borderRadius: BorderRadius.all(
                Radius.circular(width / 30),
              ),
            ),
            labelText: labelText ?? "",
            filled: true,
            fillColor: AppColors.white),
      ),
    );
  }
}
