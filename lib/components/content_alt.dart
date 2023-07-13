import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:presentation/main.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

import 'content.dart';

class ContentAlt extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? subtitleWidget;
  final Widget content;
  final Widget? otherContent;
  final bool backgroundOnTop;

  const ContentAlt({
    super.key,
    required this.title,
    this.subtitle,
    this.subtitleWidget,
    required this.content,
    this.otherContent,
    this.backgroundOnTop = false,
  });

  @override
  Widget build(BuildContext context) {
    final ZetaColors colors = ZetaColors.of(context);
    final bool isDevCon = MyAppState.of(context)?.isDevCon ?? true;

    if (!isDevCon) {
      return Content(
        title: title,
        subtitle: subtitle,
        subtitleWidget: subtitleWidget,
        content: content,
        backgroundOnTop: backgroundOnTop,
        otherContent: otherContent,
      );
    }
    return LayoutBuilder(builder: (context, constraints) {
      return Row(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              color: colors.white,
              child: Stack(
                children: [
                  Center(child: otherContent),
                  Positioned(
                    child: CustomPaint(
                      painter: BlackPaint(context),
                      size: Size(constraints.maxWidth, constraints.maxHeight),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
              color: colors.black,
              child: Stack(children: [
                Positioned(
                  top: Dimensions.m,
                  right: Dimensions.m,
                  child: SvgPicture.asset(
                    isDevCon ? 'lib/assets/logoBlack.svg' : 'lib/assets/zebra-logo-stacked.svg',
                    height: constraints.maxHeight * 0.1,
                  ),
                ),
                Positioned(
                  top: Dimensions.l,
                  right: Dimensions.l,
                  bottom: Dimensions.m,
                  left: Dimensions.l,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ZetaText.headingMedium(title, textColor: colors.textInverse),
                      if (subtitleWidget == null) ZetaText.bodyLarge(subtitle, textColor: colors.primary),
                      if (subtitleWidget != null) subtitleWidget!,
                      const SizedBox(height: Dimensions.m),
                      Expanded(
                        child: DefaultTextStyle(
                          style: ZetaText.zetaBodyMedium.copyWith(color: Colors.white),
                          child: content,
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          )
        ],
      );
    });
  }
}

class BlackPaint extends CustomPainter {
  final BuildContext context;

  BlackPaint(this.context);

  @override
  void paint(Canvas canvas, Size size) {
    Path topPath = Path()
      ..moveTo(size.width, size.height * 0.8)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width * 0.4, size.height)
      ..lineTo(size.width, size.height * 0.8)
      ..close();
    canvas.drawPath(
      topPath,
      Paint()
        ..color = ZetaColors.of(context).black
        ..style = PaintingStyle.fill,
    );

    canvas.save();
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
