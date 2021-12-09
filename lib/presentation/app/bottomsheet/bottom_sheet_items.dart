class BottomSheetItem{
  String title;
  BottomSheetItem(this.title);
}

class BottomSheetOption extends BottomSheetItem{
  BottomSheetOption(String title) : super(title);
}

class BottomSheetOption2 extends BottomSheetItem{
  String subTitle;
  BottomSheetOption2(String title,this.subTitle) : super(title);
}