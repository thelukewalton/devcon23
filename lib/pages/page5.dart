import 'package:flutter/material.dart';
import 'package:presentation/components/bullets.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

import '../components/content.dart';

class Page5 extends StatelessWidget {
  const Page5({super.key});

  @override
  Widget build(BuildContext context) {
    return Content(
      title: 'ZSB Printer',
      content: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BulletPointList(
                  content: [
                    BulletPoint(point: 'First real project in Flutter'),
                    BulletPoint(point: 'Learnt lots'),
                  ],
                ),
                const SizedBox(height: 60),
                SizedBox(
                  width: 900,
                  child: Table(
                    border: TableBorder.all(),
                    children: [
                      TableRow(children: [
                        const ZetaText('Good').inlineStart(16),
                        const ZetaText('Bad').inlineStart(16),
                      ]),
                      TableRow(children: [
                        BulletPointList(isMain: false, content: [
                          BulletPoint(point: 'App delivered on time'),
                          BulletPoint(point: 'Small codebase'),
                          BulletPoint(point: 'Smooth 60fps'),
                          BulletPoint(point: 'Native integration'),
                        ]).inlineStart(16),
                        BulletPointList(isMain: false, content: [
                          BulletPoint(point: 'Localizations'),
                          BulletPoint(point: 'Accessability'),
                          BulletPoint(point: 'Responsiveness'),
                          BulletPoint(point: 'Minimal UI customization'),
                          BulletPoint(point: 'State management'),
                        ]).inlineStart(16),
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(child: FittedBox(child: Image.asset('lib/assets/zsbapp.jpg'))).stack(200),
            // TODO: Embed some content
          ),
        ],
      ),
    );
  }
}
