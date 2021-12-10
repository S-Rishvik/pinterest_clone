import 'package:flutter/material.dart';

class AppColors{
  static const black = Colors.black;
  static const white = Colors.white;
  static final grey = fromHex("#E0E0E0");
  static final darkGrey = fromHex("#212121");
  static final greyWhite = fromHex("#EEEEEE");

  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

}

extension HexColor on Color {

}