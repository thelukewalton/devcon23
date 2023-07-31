// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:presentation/components/bullets.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

import '../components/content.dart';

class ZSBProblem extends StatelessWidget {
  const ZSBProblem({super.key});

  @override
  Widget build(BuildContext context) {
    return Content(
      title: 'ZSB Series Printer',
      backgroundOnTop: true,
      inverse: true,
      content: Column(
        children: [
          Row(
            children: [
              ZetaText.bodyLarge('The problem', textColor: ZetaColors.of(context).primary).stack(Dimensions.l),
            ],
          ),
          const Row(
            children: [
              BulletPointList(
                content: [
                  BulletPoint(point: 'Cross platform'),
                  BulletPoint(point: 'Developer experience'),
                  BulletPoint(point: 'Great UX'),
                  BulletPoint(point: 'Native features'),
                  BulletPoint(point: 'Future support'),
                ],
              ),
            ],
          ),
        ],
      ),
      leftImage: Image.asset('lib/assets/ZSB.png'),
    );
  }
}
