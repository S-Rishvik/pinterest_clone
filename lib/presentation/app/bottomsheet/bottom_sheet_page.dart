import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pinterest_clone/presentation/app/bottomsheet/bottom_sheet_items.dart';
import 'package:pinterest_clone/presentation/app/bottomsheet/widgets/bottom_sheet_list_view.dart';
import 'package:pinterest_clone/presentation/theme/app_colours.dart';
import 'package:pinterest_clone/presentation/theme/app_theme.dart';

class BottomSheetWidget extends StatelessWidget {
  static final createItems = [
    BottomSheetItem('Create'),
    BottomSheetOption('Idea Pin'),
    BottomSheetOption('Pin'),
    BottomSheetOption('Board'),
    BottomSheetOption2('title word', 'how are you this is rishvik')
  ];

  List<BottomSheetItem> list;

  BottomSheetWidget(this.list, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
          color: getBackgroundColour(context),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32), topRight: Radius.circular(32))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomSheetListView(list: list),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
            child: Center(
              child: TextButton(
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: Text('close'),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.grey,
                  primary: AppColors.black,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Color getBackgroundColour(BuildContext context) {
    if (AppTheme.isDarkTheme) {
      return Theme.of(context).colorScheme.primary;
    } else {
      return Theme.of(context).colorScheme.secondary;
    }
  }
}

