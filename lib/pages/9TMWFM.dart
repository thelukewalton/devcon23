// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:presentation/components/bullets.dart';

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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BulletPointList(
                  content: [
                    BulletPoint(point: 'UX overhaul'),
                    BulletPoint(point: 'Speed'),
                    BulletPoint(point: 'Flexiblity'),
                    BulletPoint(point: ''),
                    BulletPoint(point: 'Accessibility'),
                    BulletPoint(point: 'State management'),
                  ],
                ),
                const SizedBox(height: 60),
              ],
            ),
          ),
          const Expanded(
            child: Row(
              children: [
                MySvg(asset: 'lib/assets/Ess.svg', caption: 'ESS', withFlex: true),
                MySvg(asset: 'lib/assets/QChat.svg', caption: 'QChat', withFlex: true),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
