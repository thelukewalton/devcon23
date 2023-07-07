import 'package:flutter/material.dart';
import 'package:presentation/components/bullets.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

import '../components/content.dart';

class Page11 extends StatelessWidget {
  const Page11({super.key});

  @override
  Widget build(BuildContext context) {
    return Content(
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
                    BulletPoint(point: 'New, cross platform design system'),
                    BulletPoint(point: 'Strict, curated set of components'),
                    BulletPoint(point: 'Work in progress'),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: const Center(child: ZetaText.displayLarge('Zeta')).stack(200), //TODO: embed some content?
          ),
        ],
      ),
    );
  }
}
