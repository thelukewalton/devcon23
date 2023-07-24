// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:presentation/components/bullets.dart';

import '../components/content.dart';

class Accessibility extends StatelessWidget {
  const Accessibility({super.key});

  @override
  Widget build(BuildContext context) {
    return Content(
      title: 'Accessibility',
      subtitle: 'Our misison: AAA',
      content: BulletPointList(
        content: [
          BulletPoint(
            point: 'Responsiveness',
            subpoints: ['Screen size', 'Font Scale'],
          ),
          BulletPoint(point: 'Localization'),
          BulletPoint(point: 'Announcements'),
          BulletPoint(point: 'Semantics'),
        ],
      ),
    );
  }
}
