// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:presentation/components/bullets.dart';

import '../components/content.dart';

class Page2_1 extends StatelessWidget {
  const Page2_1({super.key});

  @override
  Widget build(BuildContext context) {
    return Content(
      title: 'Our Process',
      subtitle: 'How we convert UX to UI',
      content: BulletPointList(
        content: [
          BulletPoint(point: 'Design', subpoints: ['Figma']),
          BulletPoint(point: 'Tools', subpoints: [
            'React / Web Components',
            'Android',
            '?',
          ]),
        ],
      ),
    );
  }
}
