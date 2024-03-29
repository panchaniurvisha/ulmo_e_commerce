import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/common/app_elevated_button.dart';
import 'package:ulmo_e_commerce_app/res/common/app_text.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_colors.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_string.dart';
import 'package:ulmo_e_commerce_app/utils/routes/routes_name.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List<Map> categories = [
    {AppString.name: AppString.category, AppString.key: AppString.categoryType},
    {AppString.name: AppString.productType, AppString.key: AppString.all},
    {AppString.name: AppString.color, AppString.key: AppString.all},
    {AppString.name: AppString.size, AppString.key: AppString.all},
    {AppString.name: AppString.quality, AppString.key: AppString.all},
  ];
  double sliderValue = 0.0;
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
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.close,
                  ),
                ),
                const AppText(
                    text: AppString.filter, fontWeight: FontWeight.w500),
                const AppText(
                    text: AppString.removeData, fontWeight: FontWeight.w500),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  text: '\$${sliderValue.toStringAsFixed(2)}',
                  fontWeight: FontWeight.w500,
                ),
                // AppText(
                //   text: '\$${(700 - sliderValue).toStringAsFixed(2)}',
                //   fontWeight: FontWeight.w500,
                // ),
              ],
            ),
            Slider(
                value: sliderValue,
                min: 0.0,
                max: 700,
                activeColor: AppColors.lightYellowTwo,
                inactiveColor: AppColors.whiteTwo,
                onChanged: (value) {
                  setState(() {
                    sliderValue = value;
                  });
                }),
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
                itemBuilder: (context, index) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(text: categories[index][AppString.name]),
                        TextButton(
                            child: AppText(
                                text: categories[index][AppString.key],
                                color: AppColors.gray),
                            onPressed: () => index == 0
                                ? Navigator.pushNamed(
                                    context, RoutesName.filterOptionsScreen)
                                : Navigator.pushNamed(
                                    context, RoutesName.filterScreen)),
                      ],
                    )),
            SizedBox(
              height: height / 8,
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
