// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../components/bullets.dart';

import '../components/content.dart';
import '../components/svg.dart';

class TMWFM extends StatelessWidget {
  const TMWFM({super.key});

  @override
  Widget build(BuildContext context) {
    return Content(
      title: 'TM / WFM',
      content: Row(
        children: [
          const Expanded(
            child: BulletPointList(
              content: [
                BulletPoint(point: 'User experience', subPoints: ['Updated look and feel', '60fps']),
                BulletPoint(point: 'Developer experience', subPoints: ['~70k lines to ~35k lines']),
                BulletPoint(point: ''),
                BulletPoint(point: 'Performance'),
                BulletPoint(point: 'State management'),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                CaptionedWidget(caption: 'QChat', child: SvgPicture.asset('lib/assets/QChat.svg')),
                CaptionedWidget(caption: 'ESS', child: SvgPicture.asset('lib/assets/Ess.svg')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
