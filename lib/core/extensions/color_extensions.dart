import 'package:flutter/material.dart';

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final hexCode = hexString.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }
}
