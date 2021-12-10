import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinterest_clone/presentation/app/app_constants.dart';
import 'package:pinterest_clone/presentation/app/bottomsheet/bottom_sheet_page.dart';

class ImageCard extends StatelessWidget {
  ImageCard({Key? key, required this.url}) : super(key: key);

  final String? url;

  @override
  Widget build(BuildContext context) {
    if(url!=null){
      return ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Image.network(url!, fit: BoxFit.cover),
      );
    }else{
      return Container();
    }

  }
}

class ImageCard2 extends StatelessWidget {
  ImageCard2({Key? key, required this.url,required this.desc}) : super(key: key);

  final String? url;
  String? desc;

  @override
  Widget build(BuildContext context) {
    desc ??= '';
    if(url!=null){
      return Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Column(
              children: [
                Image.network(url!, fit: BoxFit.cover),
              ],
            ),
          ),
          SizedBox(
            height: 32,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(8, 8, 0, 0),
                    child: Text(desc!,maxLines: 1),
                  ),
                ),
                IconButton(onPressed: (){
                  Get.bottomSheet(BottomSheetWidget(AppConstants.imageMoreOptions));
                }, icon: const Icon(Icons.more_horiz))
              ],
            ),
          )
        ],
      );
    }else{
      return Container();
    }

  }
}