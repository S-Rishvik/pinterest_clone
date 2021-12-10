import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pinterest_clone/presentation/app/updates/updates_controller.dart';

class UpdatesChipsListWidget extends StatelessWidget {
  const UpdatesChipsListWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final UpdatesController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: buildList(context),
      ),
    );
  }

  List<Container> buildList(BuildContext context) {
    List<Container> list = <Container>[];
    controller.updatesChips.asMap().forEach((key, value) {
      var widget = Container(
        padding: const EdgeInsets.fromLTRB(4, 8, 0, 4),
        child: Obx(() => ActionChip(
          label: Text(value,
              style: Theme.of(context).textTheme.caption?.apply(
                color: getTextColor(key, context),
              )),
          backgroundColor: getBackgroundColor(key, context),
          onPressed: () {
            controller.selectedChip.value = key;
          },
        )),
      );
      list.add(widget);
    });
    return list;
  }

  Color getBackgroundColor(int index, BuildContext context) {
    if (controller.selectedChip.value == index) {
      return Theme.of(context).colorScheme.onPrimary;
    } else {
      return Theme.of(context).colorScheme.primary;
    }
  }

  Color getTextColor(int index, BuildContext context) {
    if (controller.selectedChip.value == index) {
      return Theme.of(context).colorScheme.primary;
    } else {
      return Theme.of(context).colorScheme.onPrimary;
    }
  }
}