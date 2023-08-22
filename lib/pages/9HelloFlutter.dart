import 'package:flutter/material.dart';
import 'package:zds_flutter/zds_flutter.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

import '../components/bullets.dart';
import '../components/content.dart';

class HelloFlutter extends StatelessWidget {
  const HelloFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Content(
          title: 'Hello Flutter',
          content: const BulletPointList(
            content: [
              BulletPoint(point: 'Download and install Flutter'),
              BulletPoint(point: 'flutter doctor', isCode: true),
              BulletPoint(point: 'flutter create hello_flutter', isCode: true),
              BulletPoint(point: 'File structure', subPoints: ['pubspec.yaml', 'main.dart']),
              BulletPoint(point: 'flutter run', isCode: true),
            ],
          ),
          otherContent: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('lib/assets/dash.png', width: constraints.maxWidth * 0.15),
                const ZetaText.labelSmall('Dash').paddingOnly(left: 20),
                const SizedBox(height: 100),
              ],
            ),
          ),
        );
      },
    );
  }
}
