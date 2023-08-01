import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

import '../main.dart';

class EndPage extends StatefulWidget {
  final String title;
  final String? subtitle;

  const EndPage({super.key, this.title = 'Thank You', this.subtitle});

  @override
  State<EndPage> createState() => _EndPageState();
}

class _EndPageState extends State<EndPage> {
  @override
  Widget build(BuildContext context) {
    final bool isDevCon = MyAppState().of(context)?.isDevCon ?? true;

    final ZetaColors colors = ZetaColors.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        return ColoredBox(
          color: colors.black,
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                right: 0,
                left: constraints.maxWidth * 0.5,
                child: Image.asset('lib/assets/end.png'),
              ),
              Positioned(
                top: 0,
                bottom: 0,
                right: 0,
                left: 0,
                child: Row(
                  children: [
                    Expanded(
                      flex: 9,
                      child: Padding(
                        padding: Dimensions.xl.square,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (isDevCon)
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(
                                        'lib/assets/logoBlack.svg',
                                        width: constraints.maxWidth * 0.2,
                                      ),
                                      SvgPicture.asset(
                                        'lib/assets/zebra-logo.svg',
                                        colorFilter: ColorFilter.mode(ZetaColors.of(context).white, BlendMode.srcIn),
                                        width: constraints.maxWidth * 0.1,
                                      ),
                                    ],
                                  ),
                                const SizedBox(height: Dimensions.xxxl),
                                if (isDevCon) const SizedBox(height: Dimensions.xxxl),
                                ZetaText(
                                  widget.title,
                                  style: ZetaText.zetaDisplayLarge,
                                  textColor: colors.textInverse,
                                ),
                                if (isDevCon) const SizedBox(height: Dimensions.m),
                                ZetaText(
                                  widget.subtitle,
                                  style: isDevCon ? ZetaText.zetaBodyLarge : ZetaText.zetaDisplayMedium,
                                  textColor: colors.textInverse,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (!isDevCon)
                                  SizedBox(
                                    width: constraints.maxWidth * 0.2,
                                    height: constraints.maxHeight * 0.1,
                                    child: SvgPicture.asset(
                                      'lib/assets/zebra-logo.svg',
                                      alignment: Alignment.centerLeft,
                                      colorFilter: ColorFilter.mode(colors.surfacePrimary, BlendMode.srcIn),
                                    ),
                                  ),
                                const SizedBox(height: Dimensions.l),
                                SizedBox(
                                  width: constraints.maxWidth * 0.5,
                                  child: ZetaText.labelSmall(
                                    'ZEBRA and the stylized Zebra head are trademarks of Zebra Technologies Corp., registered in many jurisdictions worldwide. All other trademarks are the property of their respective owners. \n©2023 Zebra Technologies Corp. and/or its affiliates. All rights reserved.',
                                    textColor: colors.textInverse,
                                  ),
                                ),
                                const SizedBox(height: Dimensions.l),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (!isDevCon)
                      Flexible(
                        child: ColoredBox(
                          color: colors.primary,
                          child: CustomPaint(
                            painter: BluePaint(context),
                            size: Size(constraints.maxWidth * 0.1, constraints.maxHeight),
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ],
          ),
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
    final Path topPath = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(0, size.height * 0.2)
      ..lineTo(0, size.width)
      ..close();
    canvas.drawPath(
      topPath,
      Paint()
        ..color = ZetaColors.of(context).onPrimary
        ..style = PaintingStyle.fill,
    );

    canvas.save();
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
