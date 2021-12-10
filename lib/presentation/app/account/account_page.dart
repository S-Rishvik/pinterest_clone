import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinterest_clone/presentation/app/account/account_controller.dart';
import 'package:pinterest_clone/presentation/app/app_constants.dart';
import 'package:pinterest_clone/presentation/app/bottomsheet/bottom_sheet_page.dart';
import 'package:pinterest_clone/presentation/app/updates/widgets/standard_grid_widget.dart';

class AccountPage extends GetView<AccountController> {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: Row(
                children: [
                  CircleAvatar(
                      minRadius: 24,
                      backgroundColor: Get.theme.colorScheme.secondary,
                      child: Text('R', style: Get.theme.textTheme.headline4)),
                  Expanded(
                      child: Center(
                          child: Text(
                    'Rishvik',
                    style: Get.theme.textTheme.headline6,
                  ))),
                  IconButton(
                      onPressed: () {
                        Get.bottomSheet(
                            BottomSheetWidget(AppConstants.accountMoreOptions));
                      },
                      icon: const Icon(Icons.more_horiz))
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                    decoration: BoxDecoration(
                        color: Get.theme.colorScheme.secondary,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(32))),
                    child: TextField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search your pins',
                        prefixIcon: Icon(Icons.search),
                      ),
                      cursorColor: Get.theme.colorScheme.onSecondary,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Get.bottomSheet(
                          BottomSheetWidget(AppConstants.accountSettings));
                    },
                    icon: const Icon(Icons.settings)),
                IconButton(
                    onPressed: () {
                      Get.bottomSheet(
                          BottomSheetWidget(AppConstants.createItems));
                    },
                    icon: const Icon(Icons.add))
              ],
            ),
            Expanded(
              child: Obx(() => controller.viewState.value.when(idle: () {
                    controller.getRandomImages(10);
                    return Container();
                  }, loading: () {
                    return Center(
                        child: CircularProgressIndicator(
                      color: Get.theme.colorScheme.onPrimary,
                    ));
                  }, success: (data) {
                    return Expanded(
                      child: StandardGrid(data, 2),
                    );
                  }, error: (message) {
                    return Text(message.toString());
                  })),
            )
          ],
        ),
      ),
    );
  }
}
