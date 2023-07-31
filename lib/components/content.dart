import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:presentation/components/title.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

import '../main.dart';

class Content extends StatefulWidget {
  final String title;
  final String? subtitle;
  final Widget? subtitleWidget;
  final Widget content;
  final Widget? otherContent;
  final bool backgroundOnTop;
  final Widget? leftImage;
  final bool inverse;

  const Content({
    super.key,
    required this.title,
    required this.content,
    this.subtitle,
    this.subtitleWidget,
    this.backgroundOnTop = false,
    this.otherContent,
    this.leftImage,
    this.inverse = false,
  });

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  @override
  Widget build(BuildContext context) {
    final ZetaColors colors = ZetaColors.of(context);
    final bool isDevCon = MyAppState.of(context)?.isDevCon ?? true;

    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        color: widget.inverse ? colors.black : colors.surfacePrimary,
        child: Stack(
          children: [
            if (widget.leftImage != null)
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: Container(
                  color: widget.inverse ? colors.white : colors.black,
                  width: constraints.maxWidth / 3,
                  padding: EdgeInsets.all(constraints.maxWidth / 12),
                  child: widget.leftImage!,
                ),
              ),
            if (widget.leftImage != null)
              CustomPaint(
                size: Size(constraints.maxWidth, constraints.maxHeight),
                painter: LeftPainter(context, widget.inverse),
              ),
            Positioned(
              top: Dimensions.m,
              right: Dimensions.m,
              child: SvgPicture.asset(
                isDevCon
                    ? colors.isDarkMode || widget.inverse
                        ? 'lib/assets/logoBlack.svg'
                        : 'lib/assets/logoWhite.svg'
                    : 'lib/assets/zebra-logo-stacked.svg',
                height: constraints.maxHeight * 0.1,
              ),
            ),
            if (!widget.backgroundOnTop && !isDevCon)
              Positioned(
                bottom: 0,
                right: 0,
                child: CustomPaint(
                  size: Size(constraints.maxWidth * 1.5, constraints.maxHeight * 0.5),
                  painter: BluePaint(context),
                ),
              ),
            Positioned(
              top: Dimensions.l,
              right: Dimensions.l,
              bottom: Dimensions.m,
              left: widget.leftImage != null ? (constraints.maxWidth / 3) + Dimensions.l : Dimensions.l,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ZetaText.headingMedium(
                    widget.title,
                    textColor: widget.inverse ? colors.textInverse : colors.textDefault,
                  ),
                  if (widget.subtitleWidget == null && (!isDevCon || widget.subtitle != null))
                    ZetaText.bodyLarge(
                      widget.subtitle,
                      textColor: widget.inverse ? colors.textInverse : colors.textDefault,
                    ),
                  if (widget.subtitleWidget != null) widget.subtitleWidget!,
                  const SizedBox(height: Dimensions.m),
                  DefaultTextStyle(
                    style: TextStyle(
                      color: widget.inverse ? colors.textInverse : colors.textDefault,
                    ),
                    child: Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: widget.content),
                          if (widget.otherContent != null) Expanded(child: widget.otherContent!),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (!isDevCon)
              Positioned(
                bottom: 0,
                right: 0,
                child: IgnorePointer(
                  child: CustomPaint(
                    size: Size(constraints.maxWidth * 1.5, constraints.maxHeight * 0.5),
                    painter: BluePaint(context),
                  ),
                ),
              ),
          ],
        ),
      );
    });
  }
}

class LeftPainter extends CustomPainter {
  final BuildContext context;
  final bool inverse;

  LeftPainter(this.context, this.inverse);

  @override
  void paint(Canvas canvas, Size size) {
    final ZetaColors colors = ZetaColors.of(context);
    Path topPath = Path()
      ..moveTo(size.width / 3, size.height * 0.86)
      ..lineTo(size.width / 3, size.height)
      ..lineTo(size.width / 6, size.height)
      ..lineTo(size.width / 3, size.height * 0.86)
      ..close();
    canvas.drawPath(
      topPath,
      Paint()
        ..color = inverse ? colors.black : colors.white
        ..style = PaintingStyle.fill,
    );

    canvas.save();
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
