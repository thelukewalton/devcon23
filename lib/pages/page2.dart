import 'package:flutter/material.dart';
import 'package:presentation/components/bullets.dart';
import 'package:presentation/components/content.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Content(
      title: 'Who we are',
      content: BulletPointList(
        content: [
          BulletPoint(point: 'Front End Development', subpoints: ['User Experience', 'Innovation and Design']),
          BulletPoint(point: 'Worldwide team'),
          BulletPoint(point: 'Web and mobile UX specialists'),
        ],
      ),
    );
  }
}
