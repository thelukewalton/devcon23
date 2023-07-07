import 'package:flutter/material.dart';
import 'package:presentation/components/bullets.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

import '../components/content.dart';

class Page10 extends StatelessWidget {
  const Page10({super.key});

  @override
  Widget build(BuildContext context) {
    return Content(
      title: 'ZDS Flutter',
      subtitle: 'pub.dev/packages/zds_flutter',
      content: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BulletPointList(
                  content: [
                    BulletPoint(point: 'Legacy components'),
                    BulletPoint(point: 'Production tested'),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: const Center(child: ZetaText.displayLarge('ZDS'))
                .stack(200), //TODO: embed some content?
          ),
        ],
      ),
    );
  }
}
