import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/commen/app_elevated_button.dart';
import 'package:ulmo_e_commerce_app/res/commen/app_text.dart';
import 'package:ulmo_e_commerce_app/res/commen/row_app_bar.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_colors.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_images.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_string.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  bool value = true;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(height / 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const RowAppBar(
                text: AppString.paymentTitle,
              ),
              AppText(
                text: AppString.paymentMethod,
                fontWeight: FontWeight.w600,
                fontSize: height / 35,
              ),
              SizedBox(
                height: height / 30,
              ),
              Row(
                children: [
                  Image.asset(
                    AppImages.mastercard,
                    height: height / 60,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width / 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        AppText(
                          text: AppString.mastercard,
                        ),
                        AppText(
                          text: AppString.expiryMasterCard,
                          color: AppColors.gray,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width / 2.5),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          value = !value;
                        });
                      },
                      splashFactory: NoSplash.splashFactory,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.lightYellowTwo,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: value
                              ? const Icon(
                                  Icons.check,
                                  size: 20.0,
                                  color: AppColors.black,
                                )
                              : const Icon(
                                  Icons.radio_button_unchecked,
                                  size: 20.0,
                                  color: AppColors.white,
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height / 40,
              ),
              Row(
                children: [
                  Image.asset(
                    AppImages.visaCard,
                    height: height / 80,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width / 35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        AppText(
                          text: AppString.visaCard,
                        ),
                        AppText(
                          text: AppString.expiryVisaCard,
                          color: AppColors.gray,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height / 40,
              ),
              Row(
                children: [
                  Image.asset(
                    AppImages.apple,
                    height: height / 40,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width / 20),
                    child: const AppText(
                      text: AppString.apple,
                    ),
                  )
                ],
              ),
              Spacer(),
              const AppElevatedButton(
                sizeBox: SizedBox(),
                text: AppString.payAmount,
              )
            ],
          ),
        ),
      ),
    );
  }
}
