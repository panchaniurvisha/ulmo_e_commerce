import 'package:flutter/cupertino.dart';
import 'package:ulmo_e_commerce_app/view/my_order_screen.dart';

import '../../view/account_screen.dart';
import '../../view/address_book_screen.dart';
import '../../view/address_screen.dart';
import '../../view/beg_screen.dart';
import '../../view/bottom_bar/bottom_screen.dart';
import '../../view/catalog_screen.dart';
import '../../view/categories_screen.dart';
import '../../view/contact_info_editing_screen.dart';
import '../../view/delivery_details_screen.dart';
import '../../view/empty_account_screen.dart';
import '../../view/empty_bag_screen.dart';
import '../../view/filter_options_screen.dart';
import '../../view/filter_screen.dart';
import '../../view/home/home_screen.dart';
import '../../view/login_page/forgot_password_page.dart';
import '../../view/login_page/login_screen.dart';
import '../../view/login_page/login_with_phone_number.dart';
import '../../view/my_details_screen.dart';
import '../../view/new_review_screen.dart';
import '../../view/no_internet_screen.dart';
import '../../view/order_screen.dart';
import '../../view/otp_Scree.dart';
import '../../view/payment_method_screen.dart';
import '../../view/product_page.dart';
import '../../view/review_screen.dart';
import '../../view/saved_items_empty_screen.dart';
import '../../view/saved_items_screen.dart';
import '../../view/setting_screen.dart';
import '../../view/sign_up_page/sign_up_screen.dart';
import '../../view/splash/splash_screen.dart';
import '../../view/story_screen.dart';
import '../../view/success_screen.dart';
import 'routes_name.dart';

Map<String, WidgetBuilder> appRoutes = {
  RoutesName.splashScreen: (context) => const SplashScreen(),
  RoutesName.signUpScreen: (context) => const SignUpScreen(),
  RoutesName.loginScreen: (context) => const LoginScreen(),
  RoutesName.homeScreen: (context) => const HomeScreen(),
  RoutesName.forgotPasswordPage: (context) => const ForgotPasswordPage(),
  RoutesName.loginWithPhoneNumber: (context) => const LoginWithPhoneNumber(),
  RoutesName.categoriesScreen: (context) => const CategoriesScreen(),
  RoutesName.filterScreen: (context) => const FilterScreen(),
  RoutesName.filterOptionsScreen: (context) => const FilterOptionsScreen(),
  RoutesName.noInternetScreen: (context) => const NoInternetScreen(),
  RoutesName.storyScreen: (context) => const StoryScreen(),
  RoutesName.productPage: (context) => const ProductPage(),
  RoutesName.reviewScreen: (context) => const ReviewScreen(),
  RoutesName.newReviewScreen: (context) => const NewReviewScreen(),
  RoutesName.emptyBegScreen: (context) => const EmptyBegScreen(),
  RoutesName.begScreen: (context) => const BegScreen(),
  RoutesName.contactInfoEditingScreen: (context) =>
      const ContactInfoEditingScreen(),
  RoutesName.deliveryDetailsScreen: (context) => const DeliveryDetailsScreen(),
  RoutesName.paymentMethodScreen: (context) => const PaymentMethodScreen(),
  RoutesName.successScreen: (context) => const SuccessScreen(),
  RoutesName.emptyAccountScreen: (context) => const EmptyAccountScreen(),
  RoutesName.otpScreen: (context) => const OtpScreen(),
  RoutesName.accountScreen: (context) => const AccountScreen(),
  RoutesName.myDetailsScreen: (context) => const MyDetailsScreen(),
  RoutesName.addressBookScreen: (context) => const AddressBookScreen(),
  RoutesName.addressScreen: (context) => const AddressScreen(),
  RoutesName.savedItemsEmptyScreen: (context) => const SavedItemsEmptyScreen(),
  RoutesName.settingScreen: (context) => const SettingScreen(),
  RoutesName.savedItemsScreen: (context) => const SavedItemsScreen(),
  RoutesName.myOrderScreen: (context) => const MyOrderScreen(),
  RoutesName.orderScreen: (context) => const OrderScreen(),
  RoutesName.bottomScreen: (context) => const BottomScreen(),
  RoutesName.catalogScreen: (context) => const CatalogScreen(),
};
