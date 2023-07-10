import 'package:flutter/material.dart';
import 'package:presentation/components/bullets.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

import '../components/content.dart';

class Page8 extends StatelessWidget {
  const Page8({super.key});

  @override
  Widget build(BuildContext context) {
    return Content(
      title: 'TM / WFM',
      content: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BulletPointList(
                  content: [
                    BulletPoint(point: 'UX overhaul'),
                    BulletPoint(point: 'Speed'),
                    BulletPoint(point: 'Flexiblity'),
                  ],
                ),
                const SizedBox(height: 60),
              ],
            ),
          ),
          Expanded(
            child: Center(child: FittedBox(child: Image.asset('lib/assets/qchat.png'))).stack(200),
            //TODO: embed some content?
          ),
        ],
      ),
    );
  }
}
