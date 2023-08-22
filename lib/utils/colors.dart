import 'package:flutter/material.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

class ColorObj {
  final String name;
  final ZetaColors colors;

  ColorObj(this.name, this.colors);
}

int iterateColors(BuildContext context, int index) {
  ZetaColors.setColors(context, colorsObj[index].colors);

  return index == colorsObj.length - 1 ? 0 : index + 1;
}

List<ColorObj> colorsObj = [
  ColorObj('Default', ZetaColors()),
  ColorObj('AAA', ZetaColors(isAAA: true)),
  ColorObj('DarkMode', ZetaColors(isDarkMode: true)),
  ColorObj('Red', red),
  ColorObj('Neon', neon),
];

ZetaColors red = ZetaColors(
  cool: ZetaColorBase.red,
  warm: ZetaColorBase.red,
  blue: ZetaColorBase.red,
  green: ZetaColorBase.red,
  orange: ZetaColorBase.red,
  purple: ZetaColorBase.red,
  yellow: ZetaColorBase.red,
  teal: ZetaColorBase.red,
  pink: ZetaColorBase.red,
  surface: ZetaColorBase.greyCool,
  background: ZetaColorBase.greyCool,
  black: ZetaColorBase.red,
  white: ZetaColorBase.red,
  primary: ZetaColorBase.greyCool,
);

ZetaColors neon = ZetaColors.fromColors(
    isDarkMode: true,
    surface: const Color(0xffff0099),
    onSurface: Colors.black,
    background: const Color(0xFFf3f315),
    primary: const Color(0xFFf3f315),
    white: const Color(0xff83f52c),
    black: const Color(0xFFf3f315));
