import 'package:flutter/material.dart';
import 'package:presentation/components/bullets.dart';

import '../components/content.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Content(
      title: 'The problem',
      subtitle: 'ZSB Series Printer',
      backgroundOnTop: true,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              BulletPointList(
                content: [
                  BulletPoint(point: 'Cross platform'),
                  BulletPoint(point: 'Great UX'),
                  BulletPoint(point: 'Long term support'),
                  BulletPoint(point: 'Native features'),
                ],
              ),
            ],
          ),
          Expanded(child: FittedBox(child: Image.asset('lib/assets/zsb.jpg')))
        ],
      ),
    );
  }
}
