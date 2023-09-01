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
                    BulletPoint(
                      point: 'Cross-platform, curated design system',
                      subPoints: [
                        'Flutter, Web Components',
                      ],
                    ),
                    BulletPoint(
                      point: 'Early alpha release',
                      subPoints: ['Color', 'Text', 'Grid', 'Spacing'],
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
