import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_colors.dart';

import '../res/commen/app_elevated_button.dart';
import '../res/commen/app_text.dart';
import '../res/constant/app_string.dart';

class SortScreen extends StatefulWidget {
  const SortScreen({Key? key}) : super(key: key);

  @override
  State<SortScreen> createState() => _SortScreenState();
}

class _SortScreenState extends State<SortScreen> {
  bool value = true;
  List<String> sortTitle = [
    AppString.priceHighToLow,
    AppString.priceLowToHigh,
    AppString.newFirst,
    AppString.popularFirst,
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.lightBlack,
      body: Center(
        child: ElevatedButton(
            child: Text(AppString.cancel),
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                isDismissible: true,
                context: context,
                builder: (context) => Container(
                  height: 520,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(width / 20),
                        topRight: Radius.circular(width / 20),
                      )),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: height / 50, horizontal: width / 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: AppString.sortTitle,
                          fontSize: height / 25,
                          fontWeight: FontWeight.w600,
                        ),
                        GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: sortTitle.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: 2,
                            mainAxisExtent: height / 12,
                            crossAxisSpacing: width / 20,
                          ),
                          itemBuilder: (context, index) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(text: sortTitle[index]),
                              index == 0
                                  ? InkWell(
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
                                                  color: Colors.black,
                                                )
                                              : const Icon(
                                                  Icons.radio_button_unchecked,
                                                  size: 20.0,
                                                  color: Colors.black,
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
              );
            }),
      ),
    );
  }
}
