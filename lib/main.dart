import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:ulmo_e_commerce_app/view/account_screen.dart';
=======
import 'package:ulmo_e_commerce_app/view/setting_screen.dart';
>>>>>>> 6ca621fe51303359affd7d9a8f571bc608f7f9e0

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        home: const AccountScreen());
=======
        home: const SettingScreen());
>>>>>>> 6ca621fe51303359affd7d9a8f571bc608f7f9e0
  }
}
