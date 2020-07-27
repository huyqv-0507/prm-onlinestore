import 'dart:ui';

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

class ColorHelper {
  static final textColor = HexColor.fromHex('#1c1d1f');
  static final bgColor = HexColor.fromHex('#e1e1e3');
  static final navBackgroundColor = HexColor.fromHex('#c8c9cc');
  static final selectedItemNavColor = HexColor.fromHex('#393a3b');
  static final unSelectedItemNavColor = HexColor.fromHex('#989b9c');
  static final btnBgAppBar = HexColor.fromHex('#ebeef5');
  static final bgItemColor = HexColor.fromHex('#f7f8fa');
  static final googleColor = HexColor.fromHex('#DB4437');
  static final facebookColor = HexColor.fromHex('#4267B2');
}
