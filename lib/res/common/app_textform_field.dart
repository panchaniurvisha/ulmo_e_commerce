import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_colors.dart';

class AppTextFormField extends StatelessWidget {
  final bool? obscureText;
  final Widget? suffixIcon;
  final String? labelText;
  final String? hintText;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  const AppTextFormField({
    Key? key,
    this.controller,
    this.labelText,
    this.validator,
    this.obscureText,
    this.suffixIcon,
    this.hintText,
    this.keyboardType,
    this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return TextFormField(
      obscureText: obscureText ?? false,
      controller: controller,
      autofocus: true,
      keyboardType: keyboardType,
      textInputAction: textInputAction ?? TextInputAction.next,
      decoration: InputDecoration(
        suffixIcon: suffixIcon ?? const SizedBox(),
        hintText: hintText!,
        filled: true,
        fillColor: AppColors.white,
        labelText: labelText ?? "Email",
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.gray),
          borderRadius: BorderRadius.all(
            Radius.circular(width / 20),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.blueColor),
          borderRadius: BorderRadius.all(
            Radius.circular(width / 20),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.redColor),
          borderRadius: BorderRadius.all(
            Radius.circular(width / 20),
          ),
        ),
      ),
      validator: validator,
    );
  }
}
