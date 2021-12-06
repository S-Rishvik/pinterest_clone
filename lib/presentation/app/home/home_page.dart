import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:pinterest_clone/presentation/app/home/home_controller.dart';

class HomePage extends GetView<HomeController>{
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Text('Home'),
      ),
    );
  }

}