// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:presentation/components/bullets.dart';
import 'package:presentation/components/content.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

class ZSBSolution extends StatelessWidget {
  const ZSBSolution({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Content(
        title: 'ZSB Series Printer',
        subtitle: 'The solution: Flutter 🎉',
        leftImage: Image.asset('lib/assets/zsbapp.png').square(100),
        inverse: true,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: constraints.maxHeight * 0.1),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: BulletPointList(
                    content: [
                      BulletPoint(point: 'Cross platform'),
                      BulletPoint(point: 'Developer experience'),
                      BulletPoint(point: 'Great UX'),
                      BulletPoint(point: 'Native features'),
                      BulletPoint(point: 'Future support'),
                    ],
                  ),
                ),
                Flexible(
                  child: BulletPointList(
                    content: [
                      BulletPoint(point: 'Waterfall'),
                      BulletPoint(point: 'Accessability'),
                      BulletPoint(point: 'Responsiveness'),
                      BulletPoint(point: 'Minimal UI customization'),
                      BulletPoint(point: 'State management'),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      );
    });
  }
}
