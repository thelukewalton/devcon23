import 'package:flutter/material.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

class ColorObj {
  final String name;
  final ZetaColors colors;

  ColorObj(this.name, this.colors);
}

int iterateColors(BuildContext context, int index) {
  ZetaColors.setColors(context, colors[index].colors);

  return index == colors.length - 1 ? 0 : index + 1;
}

List<ColorObj> colors = [
  ColorObj('Default', ZetaColors()),
  ColorObj('AAA', ZetaColors(isAAA: true)),
  ColorObj('DarkMode', ZetaColors(isDarkMode: true)),
  ColorObj('Red', red),
  ColorObj('Neon', neon),
];

ZetaColors red = ZetaColors(
  primary: ZetaColorBase.red,
  secondary: ZetaColorBase.red,
  cool: ZetaColorBase.red,
  warm: ZetaColorBase.red,
  blue: ZetaColorBase.red,
  green: ZetaColorBase.red,
  orange: ZetaColorBase.red,
  purple: ZetaColorBase.red,
  yellow: ZetaColorBase.red,
  teal: ZetaColorBase.red,
  pink: ZetaColorBase.red,
  onPrimary: ZetaColorBase.red,
  onSecondary: ZetaColorBase.red,
  onNegative: ZetaColorBase.red,
  background: ZetaColorBase.red,
  onBackground: ZetaColorBase.red,
  surface: ZetaColorBase.red,
  onSurface: ZetaColorBase.red,
  black: ZetaColorBase.red,
  white: ZetaColorBase.red,
);

ZetaColors neon = ZetaColors(
  isDarkMode: true,
  surface: const Color(0xffff0099),
  onSurface: Colors.black,
  background: const Color(0xFFf3f315),
  primary: ZetaColorBase.pink,
  white: const Color(0xff83f52c),
);
