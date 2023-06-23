import 'package:flutter/material.dart';
<<<<<<< HEAD

import 'view/country_list_screen.dart';
=======
import 'package:ulmo_e_commerce_app/view/remove_items_screen.dart';
>>>>>>> 8e6487b9e9c71d99149fe971b900614dccf32b44

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
<<<<<<< HEAD
        home: const CountryListScreen());
=======
        home: const RemoveItemScreen());
>>>>>>> 8e6487b9e9c71d99149fe971b900614dccf32b44
  }
}
