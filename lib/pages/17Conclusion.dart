import 'package:flutter/material.dart';
import '../components/bullets.dart';

import '../components/content.dart';

class FuturePage extends StatelessWidget {
  const FuturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Content(
          title: 'Conclusion',
          inverse: true,
          content: const BulletPointList(
            isDark: true,
            content: [
              BulletPoint(
                point: 'Flutter make great apps',
                subPoints: ['Android, iOS, Web, MacOS, Windows, Linux'],
              ),
              BulletPoint(point: 'Good performance'),
              BulletPoint(point: 'Great user and developer experience'),
              BulletPoint(point: 'Continuous improvements'),
              BulletPoint(point: 'Almost total native feature parity'),
            ],
          ),
          otherContent: Image.asset('lib/assets/dark_dash.png'),
          // FlutterLogo(style: FlutterLogoStyle.horizontal, size: constraints.maxWidth / 3),
        );
      },
    );
  }
}
