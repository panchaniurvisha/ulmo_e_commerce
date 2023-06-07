import 'package:flutter/material.dart';

import '../data/user_data_first_screen.dart';
import '../model/first_screen_model.dart';
import '../res/commen/app_text.dart';
import '../res/constant/app_colors.dart';
import '../res/constant/app_string.dart';

class ProductInformationScreen extends StatefulWidget {
  const ProductInformationScreen({Key? key}) : super(key: key);

  @override
  State<ProductInformationScreen> createState() =>
      _ProductInformationScreenState();
}

class _ProductInformationScreenState extends State<ProductInformationScreen> {
  List<String> information = [
    AppString.height,
    AppString.width,
    AppString.depth,
    AppString.weight,
  ];

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
                builder: (context) => Container(
                  height: height / 1.2,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(width / 20),
                        topRight: Radius.circular(width / 20),
                      )),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: height / 30, horizontal: width / 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: AppString.productInformation,
                          fontSize: height / 25,
                          fontWeight: FontWeight.w600,
                        ),
                        AppText(
                          text: AppString.measurements,
                          fontSize: height / 35,
                          fontWeight: FontWeight.w600,
                        ),
                        ListView.separated(
                          itemBuilder: (context, index) => Row(
                            children: [
                              AppText(text: information[index]),
                              AppText(
                                text: "${userModel.measurement![index].height}",
                              )
                            ],
                          ),
                          separatorBuilder: (context, index) => SizedBox(
                            height: height / 20,
                          ),
                          itemCount: information.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                        ),
                        /* GridView.builder(
                          padding: EdgeInsets.only(bottom: height / 30),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: userModel.measurement!.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: 2,
                            mainAxisExtent: height / 12,
                            crossAxisSpacing: width / 20,
                          ),
                          itemBuilder: (context, index) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                text: information[index],
                                fontSize: height / 25,
                                fontWeight: FontWeight.w600,
                              ),
                              AppText(
                                text: "${userModel.measurement![index].height}",
                              )
                            ],
                          ),
                        ),*/
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
