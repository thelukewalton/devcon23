import 'package:flutter/material.dart';

import '../components/bullets.dart';
import '../components/content.dart';
import '../components/zeta_demo.dart';

class ZetaPage extends StatelessWidget {
  const ZetaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Content(
      title: 'Zeta',
      subtitle: 'pub.dev/packages/zeta_flutter',
      content: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BulletPointList(
                  content: [
                    BulletPoint(point: 'Cross-platform, future design system'),
                    BulletPoint(
                      point: 'Formal, standardized set of components',
                      subPoints: [
                        'Flutter, React, Web Components',
                      ],
                    ),
                    BulletPoint(
                      point: 'alpha-1.0.0',
                      subPoints: [
                        'Color',
                        'Text',
                        'Grid',
                        'Spacing',
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: ZetaDemo(),
            ),
          ),
        ],
      ),
    );
  }
}
