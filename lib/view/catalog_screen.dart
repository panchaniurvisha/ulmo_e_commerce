import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/commen/app_gridview_builder.dart';
import 'package:ulmo_e_commerce_app/res/commen/row_app_bar.dart';
import 'package:ulmo_e_commerce_app/res/commen/search_bar.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_string.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
          child: Padding(
            padding: EdgeInsets.all(height / 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                RowAppBar(
                  text: AppString.title,
                ),
                SearchBar(),
                AppGridBuilder()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
