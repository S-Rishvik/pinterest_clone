import 'package:pinterest_clone/presentation/app/bottomsheet/bottom_sheet_items.dart';

class AppConstants {
  static final updatesBottomSheetList = [
    BottomSheetItem('Filter your updates'),
    BottomSheetOption('All'),
    BottomSheetOption('Comments'),
    BottomSheetOption('Photos')
  ];

  static final createItems = [
    BottomSheetItem('Create'),
    BottomSheetOption('Idea Pin'),
    BottomSheetOption('Pin'),
    BottomSheetOption('Board')
  ];

  static final imageMoreOptions = [
    BottomSheetItem('Share to'),
    BottomSheetOption('Hide Pin'),
    BottomSheetOption2('Report Pin', 'This goes against Pinterest clone\'s Community Guidelines')
  ];

  static final accountMoreOptions = [
    BottomSheetItem('Profile'),
    BottomSheetOption('Settings'),
    BottomSheetOption('Copy Profile link')
  ];

  static final accountSettings = [
    BottomSheetItem('Sort by'),
    BottomSheetOption('A to Z'),
    BottomSheetOption('Drag and drop'),
    BottomSheetOption('Last saved to'),
    BottomSheetItem('Organise profile'),
    BottomSheetOption2('Auto-sort boards', 'Choose how you want Pinterest to display your boards'),
    BottomSheetOption2('Reorder boards', 'Drag and drop to reorder boards. It will save as your custom sort by setting')
  ];
}
