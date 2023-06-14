import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:presentation/components/title.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

class Content extends StatefulWidget {
  final String title;
  final String? subtitle;

  final Widget content;

  const Content({super.key, required this.title, required this.content, this.subtitle});

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  @override
  Widget build(BuildContext context) {
    final ZetaColors colors = ZetaColors.of(context);

    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        color: ZetaColors.of(context).surfacePrimary,
        child: Stack(
          children: [
            Positioned(
              top: Dimensions.m,
              right: Dimensions.m,
              bottom: Dimensions.m,
              left: Dimensions.m,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ZetaText.headingLarge(widget.title, textColor: colors.textDefault),
                  if (widget.subtitle != null) ZetaText.headingMedium(widget.subtitle, textColor: colors.primary),
                  const SizedBox(height: Dimensions.m),
                  widget.content,
                ],
              ),
            ),
            Positioned(
              top: Dimensions.m,
              right: Dimensions.m,
              child: SvgPicture.asset(
                'lib/assets/zebra-logo-stacked.svg',
                height: constraints.maxHeight * 0.1,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CustomPaint(
                size: Size(constraints.maxWidth * 1.5, constraints.maxHeight * 0.5),
                painter: BluePaint(context),
              ),
            ),
          ],
        ),
      );
    });
  }
}
