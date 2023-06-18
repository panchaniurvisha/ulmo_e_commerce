import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/commen/app_elevated_button.dart';
import 'package:ulmo_e_commerce_app/res/commen/app_text.dart';
import 'package:ulmo_e_commerce_app/res/commen/row_app_bar.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_colors.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_images.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_string.dart';

import '../res/commen/check_box_button.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  bool value = false;
  List<Map> paymentSource = [
    {
      "image": AppImages.mastercard,
      "sourceName": AppString.mastercard,
      "expiryDate": AppString.expiryMasterCard,
    },
    {
      "image": AppImages.visaCard,
      "sourceName": AppString.visaCard,
      "expiryDate": AppString.expiryVisaCard,
    },
    {
      "image": AppImages.apple,
      "sourceName": AppString.apple,
      "expiryDate": "",
    }
  ];
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
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Row(
                        children: [
                          Image.asset(
                            paymentSource[index]["image"],
                            height: height / 60,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: width / 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  text: paymentSource[index]["sourceName"],
                                ),
                                AppText(
                                  text: paymentSource[index]["expiryDate"],
                                  color: AppColors.gray,
                                )
                              ],
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: index == 0
                                      ? width / 2.6
                                      : index == 1
                                          ? width / 2.4
                                          : width / 1.84),
                              child: CheckBoxButton(
                                value: value,
                                onTap: () {
                                  setState(() {
                                    value = !value;
                                  });
                                },
                              ))
                        ],
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: height / 30,
                      ),
                  itemCount: paymentSource.length),
              const Spacer(),
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
