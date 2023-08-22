import 'package:flutter/material.dart';
import 'package:zeta_flutter/zeta_flutter.dart';
import '../components/bullets.dart';

import '../components/content.dart';
import '../components/svg.dart';

class TMWFM extends StatelessWidget {
  const TMWFM({super.key});

  @override
  Widget build(BuildContext context) {
    return Content(
      title: 'TM / WFM',
      content: const BulletPointList(
        content: [
          BulletPoint(point: 'User experience', subPoints: ['Updated look and feel', '60fps']),
          BulletPoint(point: 'Developer experience', subPoints: ['~70k lines to ~35k lines']),
          BulletPoint(point: ''),
          BulletPoint(point: 'Performance'),
          BulletPoint(point: 'State management'),
        ],
      ),
      otherContent: Column(
        children: [
          const SizedBox(height: Dimensions.l),
          Expanded(
            child: Row(
              children: [
                CaptionedWidget(caption: 'QChat', child: Image.asset('lib/assets/QChat.png')),
                CaptionedWidget(caption: 'ESS', child: Image.asset('lib/assets/Ess.png')),
              ],
            ),
          ),
          const SizedBox(height: Dimensions.m),
        ],
      ),
    );
  }
}
