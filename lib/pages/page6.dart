import 'package:flutter/material.dart';
import 'package:presentation/components/bullets.dart';

import '../components/content.dart';

class Page6 extends StatelessWidget {
  const Page6({super.key});

  @override
  Widget build(BuildContext context) {
    return Content(
      title: 'What is Flutter?',
      content: BulletPointList(content: [
        BulletPoint(point: 'Declarative UI'),
        BulletPoint(point: 'Static analysis'),
        BulletPoint(point: 'Sound null safety'),
        BulletPoint(point: 'Rich core libraries', subpoints: ['material', 'cupertino', 'collection']),
        BulletPoint(point: 'Strong developer community', subpoints: ['pub.dev']),
      ]),
    );
  }
}
