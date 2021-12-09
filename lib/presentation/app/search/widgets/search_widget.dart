import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../search_controller.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget(this.searchController, {Key? key}) : super(key: key);

  SearchController searchController;



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Row(
        children: [
          Obx(
            () => Visibility(
              visible:
                  searchController.searchState.value == SearchState.Searched,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  searchController.searchState.value = SearchState.Idle;
                  searchController.textEditingController.clear();
                  searchController.setIdleState();
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Get.theme.colorScheme.secondary,
                  borderRadius: const BorderRadius.all(Radius.circular(32))),
              child: Obx(
                () => TextField(
                  controller: searchController.textEditingController,
                  decoration: InputDecoration(
                      hintText: 'Search for idea',
                      prefixIcon: Visibility(
                        child: const Icon(Icons.search),
                        visible: searchController.searchState.value ==
                            SearchState.Idle,
                      ),
                      suffixIcon: Visibility(
                          child: const Icon(Icons.camera_alt),
                          visible: searchController.searchState.value ==
                              SearchState.Idle)),
                  maxLines: 1,
                  onSubmitted: (value) {
                    searchController.searchState.value = SearchState.Searched;
                    searchController.getImagesByKeyWord(value);
                  },
                  onChanged: (value){
                    if(value!='') {
                      searchController.searchState.value = SearchState.Typing;
                    } else {
                      searchController.searchState.value = SearchState.Idle;
                    }

                  },
                  cursorColor: Get.theme.colorScheme.onSecondary,
                ),
              ),
            ),
          ),
          Obx(
            () => Visibility(
              visible: searchController.searchState.value == SearchState.Typing,
              child: TextButton(
                child: Text(
                  'cancel',
                  style: Get.theme.textTheme.bodyText2,
                ),
                onPressed: () {
                  searchController.searchState.value = SearchState.Idle;
                  searchController.textEditingController.clear();
                  searchController.setIdleState();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
