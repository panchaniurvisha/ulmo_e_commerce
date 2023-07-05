import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/common/app_elevated_button.dart';
import 'package:ulmo_e_commerce_app/res/common/app_text.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_string.dart';

import '../res/common/check_box_button.dart';

class FilterOptionsScreen extends StatefulWidget {
  const FilterOptionsScreen({Key? key}) : super(key: key);

  @override
  State<FilterOptionsScreen> createState() => _FilterOptionsScreenState();
}

class _FilterOptionsScreenState extends State<FilterOptionsScreen> {
  bool value = false;
  List<String> categories = [
    AppString.furniture,
    AppString.lighting,
    AppString.rugs,
    AppString.mirrors,
    AppString.blankets,
    AppString.cushions,
    AppString.curtains,
    AppString.baskets,
    AppString.vases,
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: width / 30, vertical: height / 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  padding: EdgeInsets.only(right: width / 10),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back,
                  ),
                ),
                const AppText(
                    text: AppString.category, fontWeight: FontWeight.w500),
                const AppText(
                    text: AppString.removeData, fontWeight: FontWeight.w500),
              ],
            ),
            GridView.builder(
                padding: EdgeInsets.only(top: height / 100),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 2,
                  mainAxisExtent: height / 12,
                  crossAxisSpacing: width / 20,
                ),
                itemBuilder: (context, index) => StatefulBuilder(
                      builder: (context, setState) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(text: categories[index]),
                          CheckBoxButton(
                            value: value,
                            onTap: () {
                              setState(() {
                                value = !value;
                              });
                            },
                          )
                        ],
                      ),
                    )),
            SizedBox(
              height: height / 41,
            ),
            const AppElevatedButton(
              text: AppString.showItem,
              sizeBox: SizedBox(),
            )
          ],
        ),
      ),
    ));
  }
}
