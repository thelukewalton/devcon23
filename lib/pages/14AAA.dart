import 'package:flutter/material.dart';
import 'package:zeta_flutter/zeta_flutter.dart';
import '../components/bullets.dart';

import '../components/content.dart';
import '../components/svg.dart';

class AAA extends StatelessWidget {
  const AAA({super.key});

  @override
  Widget build(BuildContext context) {
    return Content(
      title: 'Accessibility',
      subtitle: 'Achieving AAA',
      content: const BulletPointList(
        content: [
          BulletPoint(point: 'Responsiveness', subPoints: ['Screen size', 'Font scale']),
          BulletPoint(point: 'Localization'),
          BulletPoint(point: 'Color contrast'),
          BulletPoint(
            point: 'Alternate I/O',
            subPoints: ['Switches', 'Screen readers'],
          ),
        ],
      ),
      otherContent: Padding(
        padding: const EdgeInsets.all(Dimensions.m),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 3,
              child: Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: CaptionedWidget(
                      caption: 'AbleNet Blue2 Switch',
                      isExpanded: false,
                      child: Image.asset('lib/assets/blue2.jpg'),
                    ),
                  ),
                  const Flexible(child: SizedBox()),
                ],
              ),
            ),
            const SizedBox(height: 60),
            Flexible(
              flex: 2,
              child: Row(
                children: [
                  CaptionedWidget(
                    caption: 'Android TalkBack',
                    isExpanded: false,
                    child: Image.asset('lib/assets/talkback.png'),
                  ),
                  const SizedBox(width: 60),
                  CaptionedWidget(
                    caption: 'Apple VoiceOver',
                    isExpanded: false,
                    child: Image.asset('lib/assets/voiceover.png'),
                  ),
                ],
              ),
            ),
            const Flexible(flex: 2, child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
