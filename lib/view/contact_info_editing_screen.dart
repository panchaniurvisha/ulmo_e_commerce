import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/utils/routes/routes_name.dart';

import '../res/common/app_elevated_button.dart';
import '../res/common/app_text.dart';
import '../res/common/app_textform_field.dart';
import '../res/common/row_app_bar.dart';
import '../res/constant/app_colors.dart';
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
        resizeToAvoidBottomInset: false,
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
                Align(
                  alignment: Alignment.center,
                  child: AppText(
                    text: AppString.pageNumber,
                    fontWeight: FontWeight.w500,
                    fontSize: height / 60,
                    color: AppColors.gray,
                  ),
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
                      : AppString.errorTitleOfName,
                ),
                SizedBox(
                  height: height / 25,
                ),
                AppTextFormField(
                    controller: phoneNumberController,
                    labelText: AppString.numberLabelText,
                    hintText: AppString.hintTextOfNumber,
                    validator: (value) =>
                        utils.isValidMobile(phoneNumberController.text)
                            ? null
                            : AppString.errorTitleNumber,
                    keyboardType: TextInputType.phone),
                SizedBox(
                  height: height / 25,
                ),
                AppTextFormField(
                  controller: emailController,
                  labelText: AppString.emailOfScreen,
                  textInputAction: TextInputAction.done,
                  hintText: AppString.hintEmailText,
                  validator: (value) => utils.isValidEmail(emailController.text)
                      ? null
                      : AppString.errorTitleEmail,
                  keyboardType: TextInputType.emailAddress,
                ),
                const Spacer(),
                AppElevatedButton(
                    sizeBox: const SizedBox(),
                    text: AppString.continueButton,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.pushNamed(
                            context, RoutesName.deliveryDetailsScreen);
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
