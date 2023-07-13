// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:presentation/components/bullets.dart';
import 'package:presentation/components/content_alt.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

class ZSBProblem extends StatelessWidget {
  const ZSBProblem({super.key});

  @override
  Widget build(BuildContext context) {
    return ContentAlt(
      title: 'ZSB Series Printer',
      backgroundOnTop: true,
      content: Column(
        children: [
          Row(
            children: [
              ZetaText.bodyLarge('The problem', textColor: ZetaColors.of(context).primary).stack(Dimensions.l),
            ],
          ),
          Row(
            children: [
              BulletPointList(
                content: [
                  BulletPoint(point: 'Cross platform'),
                  BulletPoint(point: 'Great UX'),
                  BulletPoint(point: 'Long term support'),
                  BulletPoint(point: 'Native features'),
                ],
              ),
            ],
          ),
        ],
      ),
      otherContent: Image.asset('lib/assets/zsb2.png'),
    );
  }
}
