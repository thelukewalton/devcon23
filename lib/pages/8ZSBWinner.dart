import 'package:flutter/material.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

import '../components/bullets.dart';
import '../components/content.dart';

class ZSBSolution extends StatelessWidget {
  const ZSBSolution({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Content(
          title: 'ZSB Series Printer',
          subtitle: 'The solution: Flutter 🎉',
          leftImage: Image.asset('lib/assets/zsbapp.png').square(100),
          inverse: true,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: constraints.maxHeight * 0.1),
              ZetaText.bodyMedium('Learning opportunities:', textColor: ZetaColors.of(context).surface),
              SizedBox(height: constraints.maxHeight * 0.05),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: BulletPointList(
                      isDark: true,
                      content: [
                        BulletPoint(point: 'Accessability'),
                        BulletPoint(point: 'Responsiveness'),
                        BulletPoint(point: 'UI customization'),
                        BulletPoint(point: 'State management'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
