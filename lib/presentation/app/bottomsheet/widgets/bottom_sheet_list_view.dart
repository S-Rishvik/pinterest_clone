import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bottom_sheet_items.dart';

class BottomSheetListView extends StatelessWidget {
  const BottomSheetListView({
    Key? key,
    required this.list,
  }) : super(key: key);

  final List<BottomSheetItem> list;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: getItems(context)
    );
  }

  List<Widget> getItems(BuildContext context){
    List<Widget> widgets =<Widget>[];
    for (var item in list) {
      Widget widget;
      if (item is BottomSheetOption) {
        widget = Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            item.title,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        );
      } else if (item is BottomSheetOption2) {
        widget = Padding(
          padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                item.subTitle,
                style: Theme.of(context).textTheme.caption,
              )
            ],
          ),
        );
      } else if (item is BottomSheetItem) {
        widget = Padding(
          padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
          child: Text(
            item.title,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        );
      } else {
        widget = Container();
      }
      widgets.add(widget);
    }
    return widgets;
  }
}
