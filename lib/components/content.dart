import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vector_graphics/vector_graphics.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

import '../main.dart';
import 'title.dart';

class Content extends StatefulWidget {
  final String title;
  final String? subtitle;
  final Widget? subtitleWidget;
  final Widget content;
  final Widget? otherContent;
  final bool backgroundOnTop;
  final Widget? leftImage;
  final Widget? rightImage;
  final bool inverse;
  final int leadingFlex;
  final int trailingFlex;

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
    this.leadingFlex = 1,
    this.trailingFlex = 1,
    this.rightImage,
  });

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  @override
  Widget build(BuildContext context) {
    final ZetaColors colors = ZetaColors.of(context);
    final bool isDevCon = MyAppState().of(context)?.isDevCon ?? true;

    return LayoutBuilder(
      builder: (context, constraints) {
        return ColoredBox(
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
                    child: widget.leftImage,
                  ),
                ),
              if (widget.rightImage != null)
                Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    color: widget.inverse ? colors.white : colors.black,
                    width: constraints.maxWidth / 2,
                    child: widget.rightImage,
                  ),
                ),
              if (widget.leftImage != null)
                CustomPaint(
                  size: Size(constraints.maxWidth, constraints.maxHeight),
                  painter: LeftPainter(context, widget.inverse),
                ),
              Positioned(
                top: Dimensions.m,
                right: Dimensions.xl,
                height: constraints.maxHeight * 0.1,
                child: SvgPicture(
                  isDevCon
                      ? colors.isDarkMode || widget.inverse
                          ? const AssetBytesLoader('lib/assets/logoBlack.svg.vec')
                          : const AssetBytesLoader('lib/assets/logoWhite.svg.vec')
                      : const AssetBytesLoader('lib/assets/zebra-logo-stacked.svg.vec'),
                  height: constraints.maxHeight * 0.12,
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
                right: Dimensions.xl,
                bottom: Dimensions.m,
                top: 0,
                left: widget.leftImage != null ? (constraints.maxWidth / 3) + Dimensions.l : Dimensions.xl,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: Dimensions.l),
                          ZetaText.headingSmall(
                            widget.title,
                            textColor: widget.inverse ? colors.textInverse : colors.textDefault,
                          ),
                          if (widget.subtitleWidget == null)
                            ZetaText.bodyLarge(
                              widget.subtitle,
                              textColor: colors.primary,
                            ),
                          if (widget.subtitleWidget != null) widget.subtitleWidget!,
                          DefaultTextStyle(
                            style: TextStyle(
                              color: widget.inverse ? colors.textInverse : colors.textDefault,
                            ),
                            child: Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: widget.leadingFlex,
                                    child: Column(
                                      children: [
                                        const SizedBox(height: Dimensions.m),
                                        Expanded(child: widget.content),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (widget.otherContent != null)
                      Expanded(
                        flex: widget.trailingFlex,
                        child: Column(
                          children: [
                            SizedBox(height: constraints.maxHeight * 0.1),
                            Expanded(child: widget.otherContent!),
                          ],
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
      },
    );
  }
}

class LeftPainter extends CustomPainter {
  final BuildContext context;
  final bool inverse;

  const LeftPainter(this.context, this.inverse);

  @override
  void paint(Canvas canvas, Size size) {
    final ZetaColors colors = ZetaColors.of(context);
    final Path topPath = Path()
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
