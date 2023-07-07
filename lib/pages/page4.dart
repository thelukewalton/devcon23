import 'package:flutter/material.dart';
import 'package:presentation/components/bullets.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

import '../components/content.dart';

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    final ZetaColors colors = ZetaColors.of(context);
    return Content(
      title: 'The problem',
      backgroundOnTop: true,
      subtitleWidget: Row(
        children: [
          Expanded(child: ZetaText.headingMedium('ZSB Series Printer', textColor: colors.primary)),
          Expanded(child: ZetaText.headingMedium('The solution: Flutter', textColor: colors.primary))
        ],
      ),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                child: BulletPointList(
                  content: [
                    BulletPoint(point: 'Cross platform'),
                    BulletPoint(point: 'Great UX'),
                    BulletPoint(point: 'Long term support'),
                    BulletPoint(point: 'Native features'),
                  ],
                ),
              ),
              Flexible(
                child: BulletPointList(
                  content: [
                    BulletPoint(point: 'Android, iOS, Web (and now Windows, Mac, Linux)'),
                    BulletPoint(point: 'Built-in and external components, 60fps'),
                    BulletPoint(point: 'Open source'),
                    BulletPoint(point: 'MethodChannelAndroid, MethodChannelIos'),
                  ],
                ),
              )
            ],
          ),
          Expanded(child: FittedBox(child: Image.asset('lib/assets/zsb.jpg')))
        ],
      ),
    );
  }
}
