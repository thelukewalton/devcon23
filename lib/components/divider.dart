import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vector_graphics/vector_graphics.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

import '../main.dart';

class DividerPage extends StatefulWidget {
  final String title;
  final String? subtitle;

  const DividerPage({super.key, required this.title, this.subtitle});

  @override
  State<DividerPage> createState() => _DividerPageState();
}

class _DividerPageState extends State<DividerPage> {
  @override
  Widget build(BuildContext context) {
    final ZetaColors colors = ZetaColors.of(context);
    final bool isDevCon = MyAppState().of(context)?.isDevCon ?? true;

    return LayoutBuilder(
      builder: (context, constraints) {
        return isDevCon
            ? ColoredBox(
                color: colors.black,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: Dimensions.xxl, vertical: Dimensions.l),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SvgPicture(
                              const AssetBytesLoader('lib/assets/logoBlack.svg.vec'),
                              semanticsLabel: 'DevCon Logo',
                              alignment: Alignment.centerRight,
                              colorFilter: colors.isDarkMode
                                  ? ColorFilter.mode(
                                      colors.warm.shade30,
                                      BlendMode.srcIn,
                                    )
                                  : null,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ZetaText.titleLarge(
                                  widget.title,
                                  textColor: colors.isDarkMode ? colors.cool.shade20 : colors.textDarkMode,
                                  fontSize: 32,
                                ),
                                ZetaText.titleLarge(
                                  widget.subtitle,
                                  textColor: colors.isDarkMode ? colors.primary.shade30 : colors.primary,
                                  fontSize: 30,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Image.asset(
                      'lib/assets/divider.png',
                      color: Colors.black.withOpacity(colors.isDarkMode ? 0.4 : 0),
                      colorBlendMode: BlendMode.luminosity,
                    ),
                  ],
                ),
              )
            : Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      color: colors.black,
                      padding: Dimensions.xl.square,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const SizedBox(height: Dimensions.xxxl),
                              ZetaText.displayLarge(widget.title, textColor: colors.textInverse),
                              ZetaText.displayMedium(widget.subtitle, textColor: colors.textInverse),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      color: colors.primary,
                      width: constraints.maxWidth * 0.2,
                      child: CustomPaint(
                        painter: BluePaint(context),
                        size: Size(constraints.maxWidth * 0.2, constraints.maxHeight),
                      ),
                    ),
                  ),
                ],
              );
      },
    );
  }
}

class BluePaint extends CustomPainter {
  final BuildContext context;

  const BluePaint(this.context);

  @override
  void paint(Canvas canvas, Size size) {
    final ZetaColors colors = ZetaColors.of(context);

    final Path bottomPath = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width / 2, 0)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, 0)
      ..close();
    canvas.drawPath(
      bottomPath,
      Paint()
        ..color = colors.black
        ..style = PaintingStyle.fill,
    );
    final Path topPath = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width / 2, size.height * 0.2)
      ..lineTo(0, 0)
      ..close();
    canvas.drawPath(
      topPath,
      Paint()
        ..color = colors.onPrimary
        ..style = PaintingStyle.fill,
    );

    canvas.save();
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
