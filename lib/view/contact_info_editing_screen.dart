import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/commen/app_text_form_field.dart';

import '../res/commen/app_elevated_button.dart';
import '../res/commen/app_text.dart';
import '../res/commen/row_app_bar.dart';
import '../res/constant/app_string.dart';
import '../utils/utils.dart';

class ContactInfoEditingScreen extends StatefulWidget {
  const ContactInfoEditingScreen({super.key});

  @override
  State<ContactInfoEditingScreen> createState() =>
      _ContactInfoEditingScreenState();
}

class _ContactInfoEditingScreenState extends State<ContactInfoEditingScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  Utils utils = Utils();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(height / 50),
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const RowAppBar(
                  text: AppString.paymentTitle,
                ),
                AppText(
                  text: AppString.contactInfo,
                  fontWeight: FontWeight.w600,
                  fontSize: height / 35,
                ),
                SizedBox(
                  height: height / 25,
                ),
                AppTextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  hintText: AppString.nameHintText,
                  labelText: AppString.nameLabelText,
                  validator: (value) => utils.isValidName(nameController.text)
                      ? null
                      : AppString.errorTitle,
                ),
                SizedBox(
                  height: height / 25,
                ),
                AppTextFormField(
                    controller: phoneNumberController,
                    labelText: AppString.numberLabelText,
                    hintText: AppString.hintTextNumber,
                    validator: (value) =>
                        utils.isValidMobile(phoneNumberController.text)
                            ? null
                            : AppString.errorNumberTitle,
                    keyboardType: TextInputType.phone),
                SizedBox(
                  height: height / 25,
                ),
                AppTextFormField(
                  controller: emailController,
                  labelText: AppString.email,
                  textInputAction: TextInputAction.done,
                  hintText: AppString.hintEmailName,
                  validator: (value) => utils.isValidEmail(emailController.text)
                      ? null
                      : AppString.errorEmailTitle,
                  keyboardType: TextInputType.emailAddress,
                ),
                const Spacer(),
                const AppElevatedButton(
                  sizeBox: SizedBox(),
                  text: AppString.continueButton,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
