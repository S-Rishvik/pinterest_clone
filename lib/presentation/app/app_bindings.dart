import 'package:get/get.dart';
import 'package:pinterest_clone/presentation/app/account/account_controller.dart';
import 'package:pinterest_clone/presentation/app/app_controller.dart';
import 'package:pinterest_clone/presentation/app/home/home_controller.dart';
import 'package:pinterest_clone/presentation/app/search/search_controller.dart';
import 'package:pinterest_clone/presentation/app/updates/updates_controller.dart';

class AppBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AppController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => SearchController());
    Get.lazyPut(() => UpdatesController());
    Get.lazyPut(() => AccountController());
  }

}