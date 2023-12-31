import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vector_graphics/vector_graphics.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

import '../main.dart';

class TitlePage extends StatefulWidget {
  final String title;
  final String? subtitle;
  final String name;
  final String job;

  const TitlePage({
    super.key,
    required this.title,
    required this.name,
    this.subtitle,
    required this.job,
  });

  @override
  State<TitlePage> createState() => _TitlePageState();
}

class _TitlePageState extends State<TitlePage> {
  @override
  Widget build(BuildContext context) {
    final ZetaColors colors = ZetaColors.of(context);
    final bool isDevCon = MyAppState().of(context)?.isDevCon ?? true;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: !isDevCon ? TitleBackground(constraints: constraints) : Container(color: colors.black),
            ),
            if (isDevCon)
              Positioned(
                top: 64,
                right: 64,
                child: SvgPicture(
                  const AssetBytesLoader('lib/assets/zebra-logo.svg.vec'),
                  semanticsLabel: 'Zebra Logo',
                  height: constraints.maxHeight * 0.08,
                  colorFilter: ColorFilter.mode(
                    ZetaColors.of(context).isDarkMode
                        ? ZetaColors.of(context).warm.shade30
                        : ZetaColors.of(context).white,
                    BlendMode.srcIn,
                  ),
                  alignment: Alignment.centerRight,
                ),
              ),
            if (isDevCon)
              Positioned(
                right: 0,
                bottom: 0,
                left: constraints.maxWidth * 0.25,
                child: Image.asset(
                  'lib/assets/intro.png',
                  colorBlendMode: BlendMode.luminosity,
                  color: Colors.black.withOpacity(ZetaColors.of(context).isDarkMode ? 0.4 : 0),
                ),
              ),
            Positioned(
              top: 36,
              bottom: 0,
              left: 36,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!isDevCon)
                    SizedBox(
                      height: constraints.maxHeight * 0.08,
                      width: double.infinity,
                      child: SvgPicture(
                        const AssetBytesLoader('lib/assets/zebra-logo.svg.vec'),
                        semanticsLabel: 'Zebra Logo',
                        colorFilter: ColorFilter.mode(ZetaColors.of(context).white, BlendMode.srcIn),
                        alignment: Alignment.centerLeft,
                      ),
                    )
                  else
                    SvgPicture(
                      const AssetBytesLoader('lib/assets/logoBlack.svg.vec'),
                      semanticsLabel: 'DevCon Logo',
                      height: constraints.maxHeight * 0.15,
                      alignment: Alignment.centerRight,
                      colorFilter: ZetaColors.of(context).isDarkMode
                          ? ColorFilter.mode(ZetaColors.of(context).warm.shade30, BlendMode.srcIn)
                          : null,
                    ),
                  SizedBox(
                    width: constraints.maxWidth * 0.55,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ZetaText.displayLarge(
                          widget.title,
                          textColor: ZetaColors.of(context).isDarkMode
                              ? ZetaColors.of(context).cool.shade20
                              : ZetaColors.of(context).textDarkMode,
                          fontWeight: isDevCon ? FontWeight.w400 : FontWeight.bold,
                        ),
                        ZetaText.displayLarge(
                          widget.subtitle,
                          textColor: ZetaColors.of(context).primary,
                          resetHeight: true,
                        ),
                        ZetaText.bodySmall(
                          widget.name,
                          textColor: ZetaColors.of(context).isDarkMode
                              ? ZetaColors.of(context).cool.shade20
                              : ZetaColors.of(context).textDarkMode,
                          fontWeight: FontWeight.bold,
                        ),
                        ZetaText.bodyXSmall(
                          widget.job,
                          textColor: colors.primary,
                          resetHeight: true,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.15),
                ],
              ).square(Dimensions.l),
            ),
          ],
        );
      },
    );
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
          child: ColoredBox(
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

  const GreyPaint(this.context);

  @override
  void paint(Canvas canvas, Size size) {
    final ZetaColors colors = ZetaColors.of(context);
    final Path topPath = Path()
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

    final Path bottomPath = Path()
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

  const BluePaint(this.context);

  @override
  void paint(Canvas canvas, Size size) {
    final Path topPath = Path()
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
