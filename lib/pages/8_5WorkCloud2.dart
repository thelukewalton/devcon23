import 'package:flutter/material.dart';

import '../components/bullets.dart';
import '../components/content.dart';
import '../components/svg.dart';

class WorkCloud2 extends StatelessWidget {
  const WorkCloud2({super.key});

  @override
  Widget build(BuildContext context) {
    return Content(
      title: 'Zebra Workcloud',
      subtitle: '~70k lines to ~35k lines',
      content: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Flexible(
            child: BulletPointList(
              content: [
                BulletPoint(point: 'Accessability'),
                BulletPoint(point: 'Responsiveness'),
                BulletPoint(point: 'UI customization'),
                BulletPoint(point: 'State management'),
              ],
            ),
          ),
          Flexible(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(children: [CaptionedWidget(caption: 'QChat', child: Image.asset('lib/assets/QChat.png'))]),
                const SizedBox(width: 80),
                Column(children: [CaptionedWidget(caption: 'ESS', child: Image.asset('lib/assets/Ess.png'))]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
