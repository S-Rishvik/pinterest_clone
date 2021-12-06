import 'package:flutter/cupertino.dart';
import 'package:pinterest_clone/presentation/app/account/account_page.dart';
import 'package:pinterest_clone/presentation/app/home/home_page.dart';
import 'package:pinterest_clone/presentation/app/search/search_page.dart';
import 'package:pinterest_clone/presentation/app/updates/updates_page.dart';

class AppPages {
  // static const INITIAL = Routes.LOADING;
  //
  // static final routes = [
  //   GetPage(
  //     name: Routes.HOME,
  //     page: () => HomeViewCubit(),
  //   ),
  //   GetPage(
  //     name: Routes.LOADING,
  //     page: () => LoadingView(),
  //     binding: LoadingBinding(),
  //   ),
  // ];

  static final bottomNavPages = [
    HomePage(),
    SearchPage(),
    UpdatesPage(),
    AccountPage()
  ];

  static Widget getCurrentBottomNavPage(int index) {
    if (index > 2) {
      return bottomNavPages[index - 1];
    } else {
      return bottomNavPages[index];
    }
  }
}
