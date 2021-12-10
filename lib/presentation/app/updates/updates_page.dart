import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:pinterest_clone/presentation/app/app_constants.dart';
import 'package:pinterest_clone/presentation/app/bottomsheet/bottom_sheet_page.dart';
import 'package:pinterest_clone/presentation/app/bottomsheet/widgets/bottom_sheet_list_view.dart';
import 'package:pinterest_clone/presentation/app/updates/updates_controller.dart';
import 'package:pinterest_clone/presentation/app/updates/widgets/standard_grid_widget.dart';
import 'package:pinterest_clone/presentation/app/updates/widgets/update_chips_list_widget.dart';

class UpdatesPage extends GetView<UpdatesController> {
  const UpdatesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: Column(
          children: [
            Row(
              children: [
                Expanded(child: UpdatesChipsListWidget(controller: controller)),
                IconButton(
                    onPressed: () {
                      Get.bottomSheet(BottomSheetWidget(
                          AppConstants.updatesBottomSheetList));
                    },
                    icon: const Icon(Icons.settings))
              ],
            ),
            Obx(() => getPage())
          ],
        ),
      ),
    );
  }

  Widget getPage() {
    if (controller.selectedChip.value == 0) {
      return controller.viewState.value.when(idle: () {
        controller.getRandomImages(10);
        return Container();
      }, loading: () {
        return Center(
            child: CircularProgressIndicator(
          color: Get.theme.colorScheme.onPrimary,
        ));
      }, success: (data) {
        return Expanded(
          child: StandardGrid(data, 1),
        );
      }, error: (message) {
        return Text(message.toString());
      });
    } else {
      return Container(
        margin: EdgeInsets.fromLTRB(16, 16, 16, 8),
        decoration: BoxDecoration(
            color: Get.theme.colorScheme.secondary,
            borderRadius: const BorderRadius.all(Radius.circular(32))),
        child: TextField(
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Search by name or email address',
            prefixIcon: Icon(Icons.search),
          ),
          cursorColor: Get.theme.colorScheme.onSecondary,
        ),
      );
    }
  }
}
