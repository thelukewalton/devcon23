import 'package:flutter/material.dart';
import '../components/bullets.dart';

import '../components/content.dart';

class FuturePage extends StatelessWidget {
  const FuturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Content(
      title: 'Future',
      content: BulletPointList(
        content: [
          BulletPoint(
            point: 'Flutter',
            subPoints: [
              'Technical debt',
              'Performance',
              'Quality',
              'Security',
            ],
          ),
          BulletPoint(point: ''),
          BulletPoint(point: 'Transition apps to Flutter'),
        ],
      ),
    );
  }
}
