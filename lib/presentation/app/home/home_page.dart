import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:pinterest_clone/presentation/app/home/home_controller.dart';
import 'package:pinterest_clone/presentation/app/home/widgets/chips_list_widget.dart';
import 'package:pinterest_clone/presentation/app/home/widgets/pinterest_grid_view.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .primary,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              ChipsList(controller: controller),
              Obx(() =>
                  controller.viewState.value.when(
                      idle: () {
                        controller.getImagesFromSelectedChip();
                        return Container();
                      },
                      loading: () {
                        return Center(child: CircularProgressIndicator(color: Theme.of(context).colorScheme.onPrimary,));
                      },
                      success: (data) {
                        return Expanded(
                            child: PinterestGrid(data)
                        );
                      },
                      error: (message) {
                        return Text(message.toString());
                      }))
            ],
          )),
    );
  }
}
