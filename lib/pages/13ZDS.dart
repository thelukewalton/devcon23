// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:presentation/components/bullets.dart';
import 'package:presentation/components/zds_demo.dart';

import '../components/content.dart';

class ZDS extends StatelessWidget {
  const ZDS({super.key});

  @override
  Widget build(BuildContext context) {
    return Content(
      title: 'ZDS Flutter',
      subtitle: 'pub.dev/packages/zds_flutter',
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
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
          const SizedBox(
            width: 1200,
            child: Expanded(
              child: ZDSDemo(),
            ),
          )
        ],
      ),
    );
  }
}
