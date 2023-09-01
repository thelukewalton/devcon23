import 'package:flutter/material.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

import '../components/bullets.dart';
import '../components/content.dart';

class ZSBProblem extends StatelessWidget {
  const ZSBProblem({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Content(
          title: 'ZSB Series Printer',
          subtitle: 'New experience for Zebra',
          inverse: true,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: constraints.maxHeight * 0.08),
              const BulletPointList(
                isDark: true,
                content: [
                  BulletPoint(point: 'Great UX'),
                  BulletPoint(point: 'Cross platform'),
                  BulletPoint(point: 'Native features'),
                  BulletPoint(point: 'Developer experience'),
                ],
              ),
              SizedBox(height: constraints.maxHeight * 0.12),
              ZetaText.bodyLarge(''),
            ],
          ),
          leftImage: Image.asset('lib/assets/ZSB.png'),
        );
      },
    );
  }
}
