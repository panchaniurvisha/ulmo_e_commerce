import 'package:flutter/material.dart';

import '../data/user_data_first_screen.dart';
import '../model/first_screen_model.dart';
import '../res/commen/app_elevated_button.dart';
import '../res/commen/app_text.dart';
import '../res/constant/app_colors.dart';
import '../res/constant/app_string.dart';

class DeliveryAddress extends StatefulWidget {
  const DeliveryAddress({super.key});

  @override
  State<DeliveryAddress> createState() => _DeliveryAddressState();
}

class _DeliveryAddressState extends State<DeliveryAddress> {
  bool value = true;
  @override
  Widget build(BuildContext context) {
    FirstScreenModel? userModel = FirstScreenModel.fromJson(userData);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.lightBlack,
      body: Center(
        child: ElevatedButton(
            child: const Text(AppString.cancel),
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                isDismissible: true,
                context: context,
                builder: (context) => StatefulBuilder(
                  builder: (context, setState) => Container(
                    height: height / 2,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(width / 20),
                          topRight: Radius.circular(width / 20),
                        )),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: height / 30, horizontal: width / 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: AppString.deliveryTitle,
                            fontSize: height / 25,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: height / 40,
                          ),
                          GridView.builder(
                            padding: EdgeInsets.only(bottom: height / 30),
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: userModel.address!.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              childAspectRatio: 2,
                              mainAxisExtent: height / 12,
                              crossAxisSpacing: width / 20,
                            ),
                            itemBuilder: (context, index) => Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: height / 40, right: width / 20),
                                  child: Icon(Icons.location_on_outlined, size: height / 30),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(text: "${userModel.address![index].street}"),
                                    AppText(text: "${userModel.address![index].home}", color: AppColors.gray),
                                  ],
                                ),
                                index == 0
                                    ? Padding(
                                        padding: EdgeInsets.only(left: width / 20),
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
                                                      color: AppColors.black,
                                                    ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                          const AppElevatedButton(
                            text: AppString.cancel,
                            color: AppColors.white,
                            sizeBox: SizedBox(),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
