import 'package:flutter/material.dart';
import 'package:presentation/components/bullets.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

import '../components/content.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Content(
      title: 'The problem',
      content: BulletPointList(
        content: [
          BulletPoint(point: 'Cross platform'),
          BulletPoint(point: 'Great UX'),
          BulletPoint(point: 'Long term support'),
          BulletPoint(point: 'Native features'),
          BulletPoint(point: ''),
          // const Divider(),TODO: allow for widgets here
          BulletPoint(point: 'Flutter', subpoints: [
            'Android, iOS, Web (and now Windows, Mac, Linux)',
            'Built in components, 60fps',
            'Open source',
            'MethodChannelAndroid, MethodChannelIos ',
          ]),
        ],
      ),
    );
  }
}
