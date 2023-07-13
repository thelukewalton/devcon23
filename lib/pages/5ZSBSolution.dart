// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:presentation/components/bullets.dart';
import 'package:presentation/components/content_alt.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

class ZSBSolution extends StatelessWidget {
  const ZSBSolution({super.key});

  @override
  Widget build(BuildContext context) {
    final ZetaColors colors = ZetaColors.of(context);
    return ContentAlt(
      title: 'ZSB Series Printer',
      backgroundOnTop: true,
      otherContent: Image.asset('lib/assets/zsb2.png'), //TODO: Get SVG verision
      content: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ZetaText.bodyLarge('The problem', textColor: colors.primary).stack(Dimensions.l),
              ),
              Expanded(
                child: ZetaText.bodyLarge(
                  'The solution: Flutter',
                  textColor: colors.primary,
                ).stack(Dimensions.l),
              ),
            ],
          ),
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
                    BulletPoint(point: 'Android, iOS, Web'),
                    BulletPoint(point: 'Quality components'),
                    BulletPoint(point: 'Open source'),
                    BulletPoint(point: 'MethodChannel'),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
