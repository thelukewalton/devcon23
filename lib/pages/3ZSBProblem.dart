import 'package:flutter/material.dart';

import '../components/bullets.dart';
import '../components/content.dart';

class ZSBProblem extends StatelessWidget {
  const ZSBProblem({super.key});

  @override
  Widget build(BuildContext context) {
    return Content(
      title: 'ZSB Series Printer',
      backgroundOnTop: true,
      inverse: true,
      content: const BulletPointList(
        isDark: true,
        content: [
          BulletPoint(point: 'Great UX'),
          BulletPoint(point: 'Native features'),
          BulletPoint(point: 'Developer experience'),
          BulletPoint(point: 'Cross platform'),
        ],
      ),
      leftImage: Image.asset('lib/assets/ZSB.png'),
    );
  }
}
