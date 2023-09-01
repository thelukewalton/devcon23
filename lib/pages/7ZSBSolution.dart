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
          subtitle: 'Our findings',
          leftImage: Image.asset('lib/assets/zsbapp.png').square(100),
          inverse: true,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: constraints.maxHeight * 0.08),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ZetaText('Good 👍', textColor: Theme.of(context).colorScheme.background),
                        SizedBox(height: constraints.maxHeight * 0.04),
                        const BulletPointList(
                          isDark: true,
                          content: [
                            BulletPoint(point: 'Flutter'),
                            BulletPoint(point: 'Performance'),
                            BulletPoint(point: 'User experience'),
                            BulletPoint(point: 'Developer experience'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ZetaText('Less good 👎', textColor: Theme.of(context).colorScheme.background),
                        SizedBox(height: constraints.maxHeight * 0.04),
                        const BulletPointList(
                          isDark: true,
                          content: [
                            BulletPoint(point: 'Accessability'),
                            BulletPoint(point: 'Responsiveness'),
                            BulletPoint(point: 'UI customization'),
                            BulletPoint(point: 'State management'),
                          ],
                        ),
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
