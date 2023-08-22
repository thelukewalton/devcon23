import 'package:flutter/material.dart';

import '../components/bullets.dart';
import '../components/content.dart';
import '../components/zds_demo.dart';

class ZDS extends StatelessWidget {
  const ZDS({super.key});

  @override
  Widget build(BuildContext context) {
    return const Content(
      title: 'ZDS Flutter',
      subtitle: 'pub.dev/packages/zds_flutter',
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BulletPointList(
                  content: [
                    BulletPoint(point: 'Current design components'),
                    BulletPoint(point: 'Production tested'),
                  ],
                ),
              ],
            ),
          ),
          Flexible(flex: 2, child: ZDSDemo()),
        ],
      ),
    );
  }
}
