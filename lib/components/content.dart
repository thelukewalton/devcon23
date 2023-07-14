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

  const Content({
    super.key,
    required this.title,
    required this.content,
    this.subtitle,
    this.subtitleWidget,
    this.backgroundOnTop = false,
    this.otherContent,
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
        color: ZetaColors.of(context).surfacePrimary,
        child: Stack(
          children: [
            Positioned(
              top: Dimensions.m,
              right: Dimensions.m,
              child: SvgPicture.asset(
                isDevCon
                    ? colors.isDarkMode
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
              left: Dimensions.l,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ZetaText.headingMedium(widget.title, textColor: colors.textDefault),
                  if (widget.subtitleWidget == null && (isDevCon || widget.subtitle != null))
                    ZetaText.bodyLarge(widget.subtitle, textColor: colors.primary),
                  if (widget.subtitleWidget != null) widget.subtitleWidget!,
                  const SizedBox(height: Dimensions.m),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: widget.content),
                        if (widget.otherContent != null)
                          Expanded(
                            child: widget.otherContent!,
                          ),
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
    });
  }
}
