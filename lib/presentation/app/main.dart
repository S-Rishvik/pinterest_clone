import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinterest_clone/presentation/app/app_bindings.dart';
import 'package:pinterest_clone/presentation/app/app_constants.dart';
import 'package:pinterest_clone/presentation/app/app_controller.dart';
import 'package:pinterest_clone/presentation/app/bottomsheet/bottom_sheet_page.dart';
import 'package:pinterest_clone/presentation/routes/app_pages.dart';
import 'package:pinterest_clone/presentation/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pinterest Clone',
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: AppPage(),
      initialBinding: AppBindings(),
    );
  }
}

class AppPage extends GetView<AppController> {
  const AppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Obx(() => AppPages.getCurrentBottomNavPage(controller.currentIndex.value)),
      bottomNavigationBar: Container(
        margin : const EdgeInsets.fromLTRB(32, 0, 32, 8),
        child: SafeArea(
          child: Obx(
            () => ClipRRect(
              borderRadius: BorderRadius.circular(32.0),
              child: BottomNavigationBar(
                backgroundColor: Get.theme.colorScheme.secondary,
                type: BottomNavigationBarType.fixed,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home_filled), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.search), label: 'Search'),
                  BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.message), label: 'Updates'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: 'Account')
                ],
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedItemColor: Theme.of(context).colorScheme.onPrimary,
                unselectedItemColor: Theme.of(context).colorScheme.secondaryVariant,
                currentIndex: controller.currentIndex.value,
                onTap: (int index) {
                  if(index==2){
                    Get.bottomSheet(BottomSheetWidget(AppConstants.createItems));
                  }else{
                    controller.currentIndex.value = index;
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

