import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:pinterest_clone/presentation/app/home/widgets/pinterest_grid_view.dart';
import 'package:pinterest_clone/presentation/app/search/search_controller.dart';
import 'package:pinterest_clone/presentation/app/search/widgets/search_widget.dart';

class SearchPage extends GetView<SearchController> {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: Column(
          children: [
            SearchWidget(controller),
            Obx(() =>
                controller.viewState.value.when(
                    idle: () {
                      return Container();
                    },
                    loading: () {
                      return Center(child: CircularProgressIndicator(color: Theme.of(context).colorScheme.onPrimary));
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
        ),
      ),
    );
  }
}


