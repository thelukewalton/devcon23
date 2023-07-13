// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:presentation/components/bullets.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

import '../components/content.dart';

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
                Svg(asset: 'lib/assets/Ess.svg', caption: 'ESS'),
                Svg(asset: 'lib/assets/QChat.svg', caption: 'QChat'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Svg extends StatelessWidget {
  final String caption;
  final String asset;
  const Svg({super.key, required this.caption, required this.asset});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 9,
            child: FittedBox(child: SvgPicture.asset(asset)),
          ),
          Flexible(
            child: ZetaText.labelSmall(caption),
          ),
        ],
      ),
    );
  }
}
