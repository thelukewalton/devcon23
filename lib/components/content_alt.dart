import 'package:flutter/material.dart';
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
    if (!(MyAppState.of(context)?.isDevCon ?? true)) {
      return Content(
        title: title,
        subtitle: subtitle,
        subtitleWidget: subtitleWidget,
        content: content,
        backgroundOnTop: backgroundOnTop,
      );
    }
    return LayoutBuilder(builder: (context, constraints) {
      return Row(
        children: [
          Flexible(
            flex: 1,
            child: Stack(
              children: [
                Positioned(
                  child: CustomPaint(
                    painter: BlackPaint(context),
                    size: Size(constraints.maxWidth, constraints.maxHeight),
                  ),
                )
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: content,
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
