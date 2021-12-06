import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinterest_clone/presentation/app/app_bindings.dart';
import 'package:pinterest_clone/presentation/app/app_controller.dart';
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
      title: 'Flutter Demo',
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
      body: Obx(() => AppPages.getCurrentBottomNavPage(controller.currentIndex.value)),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
        child: SafeArea(
          child: Obx(
            () => BottomNavigationBar(
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
              unselectedItemColor: Theme.of(context).colorScheme.secondary,
              currentIndex: controller.currentIndex.value,
              onTap: (int index) {
                if(index!=2) {
                  controller.currentIndex.value = index;
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
        child: SafeArea(
          child: BottomNavigationBar(
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
            unselectedItemColor: Theme.of(context).colorScheme.secondary,
            currentIndex: currentIndex,
            onTap: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
