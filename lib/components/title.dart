import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:zeta_flutter/zeta_flutter.dart';

class TitlePage extends StatefulWidget {
  final String title;
  final String subtitle;
  final String name;
  final String date;
  const TitlePage({super.key, required this.title, required this.name, required this.subtitle, required this.date});

  @override
  State<TitlePage> createState() => _TitlePageState();
}

class _TitlePageState extends State<TitlePage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        children: [
          Positioned(top: 0, bottom: 0, left: 0, right: 0, child: TitleBackground(constraints: constraints)),
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: constraints.maxHeight * 0.08,
                  width: double.infinity,
                  child: SvgPicture.asset(
                    'lib/assets/zebra-logo.svg',
                    semanticsLabel: 'Zebra Logo',
                    colorFilter: ColorFilter.mode(ZetaColors.of(context).white, BlendMode.srcIn),
                    alignment: Alignment.centerLeft,
                  ),
                ),
                SizedBox(
                  width: constraints.maxWidth * 0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ZetaText.displayMedium(
                        widget.title,
                        textColor: ZetaColors.of(context).surface,
                        fontWeight: FontWeight.bold,
                      ),
                      ZetaText.displaySmall(
                        widget.subtitle,
                        textColor: ZetaColors.of(context).primary,
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ZetaText.headingMedium(
                      widget.name,
                      textColor: ZetaColors.of(context).surface,
                    ),
                    ZetaText.headingMedium(
                      widget.date,
                      textColor: ZetaColors.of(context).surface,
                    ),
                  ],
                ),
                SizedBox(height: constraints.maxHeight * 0.1),
              ],
            ).square(Dimensions.l),
          ),
        ],
      );
    });
  }
}

class TitleBackground extends StatelessWidget {
  final BoxConstraints constraints;
  const TitleBackground({super.key, required this.constraints});

  @override
  Widget build(BuildContext context) {
    final ZetaColors colors = ZetaColors.of(context);
    return Row(
      children: [
        Flexible(
          flex: 5,
          child: Container(
            color: colors.isDarkMode ? colors.white : colors.black,
            child: CustomPaint(
              size: Size(constraints.maxWidth * (5 / 6), constraints.maxHeight),
              painter: BluePaint(context),
            ),
          ),
        ),
        CustomPaint(
          size: Size(constraints.maxWidth * (1 / 6), constraints.maxHeight),
          painter: GreyPaint(context),
        ),
      ],
    );
  }
}

class GreyPaint extends CustomPainter {
  final BuildContext context;

  GreyPaint(this.context);

  @override
  void paint(Canvas canvas, Size size) {
    final ZetaColors colors = ZetaColors.of(context);
    Path topPath = Path()
      ..moveTo(0, 0)
      ..lineTo(size.height * 0.4, 0)
      ..lineTo(0, size.height * 0.4)
      ..lineTo(0, 0)
      ..close();
    canvas.drawPath(
      topPath,
      Paint()
        ..color = colors.cool.shade40
        ..style = PaintingStyle.fill,
    );

    Path bottomPath = Path()
      ..moveTo(0, size.height * 0.8)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, size.height * 0.8)
      ..close();

    canvas.drawPath(
      bottomPath,
      Paint()
        ..color = colors.warm.shade70
        ..style = PaintingStyle.fill,
    );

    canvas.save();
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class BluePaint extends CustomPainter {
  final BuildContext context;

  BluePaint(this.context);

  @override
  void paint(Canvas canvas, Size size) {
    Path topPath = Path()
      ..moveTo(size.width, size.height * 0.7)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width * 0.7, size.height)
      ..lineTo(size.width, size.height * 0.7)
      ..close();
    canvas.drawPath(
      topPath,
      Paint()
        ..color = ZetaColors.of(context).primary.shade70
        ..style = PaintingStyle.fill,
    );

    canvas.save();
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
