import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

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
    final ZetaColors colors = ZetaColors.of(context);
    return LayoutBuilder(builder: (context, constraints) {
      return Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              flex: 9,
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
                        ZetaText.displayLarge(
                          widget.title,
                          textColor: colors.textInverse,
                        ),
                        ZetaText.displayMedium(
                          widget.subtitle,
                          textColor: colors.textInverse,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                        ZetaText.bodySmall(
                          'ZEBRA and the stylized Zebra head are trademarks of Zebra Technologies Corp., registered in many juristictions worldwide. All other trademarks are properties of their respective owners. ©2023 Zebra Technologies Corp. and/or its affiliates. All rights reserved.',
                          textColor: colors.textInverse,
                        ),
                        const SizedBox(height: Dimensions.l),
                      ],
                    ),
                  ],
                ),
              )),
          Flexible(
            child: Container(
              color: colors.primary,
              child: CustomPaint(
                painter: BluePaint(context),
                size: Size(constraints.maxWidth * 0.1, constraints.maxHeight),
              ),
            ),
          )
        ],
      );
    });
  }
}

class BluePaint extends CustomPainter {
  final BuildContext context;

  BluePaint(this.context);

  @override
  void paint(Canvas canvas, Size size) {
    Path topPath = Path()
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
