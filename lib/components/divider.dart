import 'package:flutter/material.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

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
    return LayoutBuilder(builder: (context, constraints) {
      return Row(
        mainAxisSize: MainAxisSize.max,
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
              )),
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
    });
  }
}

class BluePaint extends CustomPainter {
  final BuildContext context;

  BluePaint(this.context);

  @override
  void paint(Canvas canvas, Size size) {
    Path bottomPath = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width / 2, 0)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, 0)
      ..close();
    canvas.drawPath(
      bottomPath,
      Paint()
        ..color = ZetaColors.of(context).black
        ..style = PaintingStyle.fill,
    );
    Path topPath = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width / 2, size.height * 0.2)
      ..lineTo(0, 0)
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
