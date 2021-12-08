import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:pinterest_clone/presentation/app/home/home_controller.dart';
import 'package:pinterest_clone/presentation/app/home/widgets/chips_list_widget.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .primary,
          body: Column(
            children: [
              ChipsList(controller: controller),
              Obx(() =>
                  controller.viewState.value.when(
                      idle: () {
                        return MaterialButton(
                            child: Text('Call API'),
                            onPressed: () {
                              controller.getImagesByKeyWord("Mountains");
                            });
                      },
                      loading: () {
                        return Center(child: CircularProgressIndicator(color: Theme.of(context).colorScheme.onPrimary,));
                      },
                      success: (data) {
                        return Text(data.results.toString());
                      },
                      error: (message) {
                        return Text(message.toString());
                      }))
            ],
          )),
    );
  }
}
