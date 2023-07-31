// ignore_for_file: file_names
import 'package:flutter/material.dart';
import '../components/bullets.dart';

import '../components/content.dart';

class AAA extends StatelessWidget {
  const AAA({super.key});

  @override
  Widget build(BuildContext context) {
    return const Content(
      title: 'Accessibility',
      subtitle: 'Achieving AAA',
      content: BulletPointList(
        content: [
          BulletPoint(point: 'Responsiveness', subPoints: ['Screen size', 'Font scale']),
          BulletPoint(point: 'Localization'),
          BulletPoint(point: 'Color contrast'),
          BulletPoint(point: 'Screen readers', subPoints: ['Semantics']),
        ],
      ),
    );
  }
}
