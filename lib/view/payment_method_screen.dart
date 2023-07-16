import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/common/app_elevated_button.dart';
import 'package:ulmo_e_commerce_app/res/common/app_text.dart';
import 'package:ulmo_e_commerce_app/res/common/row_app_bar.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_colors.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_images.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_string.dart';
import 'package:ulmo_e_commerce_app/utils/routes/routes_name.dart';

import '../res/common/check_box_button.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  List<bool> checkedList = [];
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
  void initState() {
    // TODO: implement initState
    super.initState();
    checkedList = List.generate(paymentSource.length, (index) => false);
  }

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
              Align(
                alignment: Alignment.center,
                child: AppText(
                  text: AppString.page,
                  fontWeight: FontWeight.w500,
                  fontSize: height / 60,
                  color: AppColors.gray,
                ),
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
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: index == 2 ? height / 35 : 2.5),
                            child: Image.asset(
                              paymentSource[index]["image"],
                              height: index == 0
                                  ? height / 60
                                  : index == 1
                                      ? height / 90
                                      : height / 30,
                            ),
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
                                  bottom: height / 40,
                                  left: index == 0
                                      ? width / 2.8
                                      : index == 1
                                          ? width / 2.3
                                          : width / 2),
                              child: CheckBoxButton(
                                value: checkedList[index],
                                onTap: () {
                                  setState(() {
                                    checkedList[index] = !checkedList[index];
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
              AppElevatedButton(
                sizeBox: const SizedBox(),
                text: AppString.payAmount,
                onPressed: () =>
                    Navigator.pushNamed(context, RoutesName.successScreen),
              )
            ],
          ),
        ),
      ),
    );
  }
}
