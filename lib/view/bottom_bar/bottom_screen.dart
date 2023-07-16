import 'package:flutter/material.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_colors.dart';
import 'package:ulmo_e_commerce_app/res/constant/app_images.dart';
import 'package:ulmo_e_commerce_app/view/beg_screen.dart';
import 'package:ulmo_e_commerce_app/view/home/home_screen.dart';

import '../account_screen.dart';
import '../saved_items_screen.dart';

class BottomScreen extends StatefulWidget {
  const BottomScreen({Key? key}) : super(key: key);

  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  int currentIndex = 0;
  final List<Widget> listOfScreen = [
    const HomeScreen(),
    const BegScreen(),
    const SavedItemsScreen(),
    const AccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          type:
              BottomNavigationBarType.fixed, // Fixed// <-- This works for fixed
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset(AppImages.homeScreenIcon, height: height / 40),
              label: '',
              activeIcon: Image.asset(AppImages.homeScreenFilledIcon,
                  height: height / 40),
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              label: '',
              activeIcon: Icon(Icons.shopping_bag),
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined),
              label: '',
              activeIcon: Icon(Icons.favorite),
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined),
              label: '',
              activeIcon: Icon(Icons.person),
            ),
          ],
          onTap: (value) {
            debugPrint("Value---->$value");
            setState(() {
              currentIndex = value;
            });
          },
          selectedItemColor: AppColors.lightBlack,
          unselectedItemColor: AppColors.gray400,

          showUnselectedLabels: true,
          showSelectedLabels: true,
          iconSize: height / 30,
          backgroundColor: AppColors.skyWhite,
        ),
        body: listOfScreen.elementAt(currentIndex),
      ),
    );
  }
}
