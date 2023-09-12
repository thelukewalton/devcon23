import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

import '../components/bullets.dart';
import '../components/content.dart';
import '../components/zeta_demo.dart';

class ZetaPage extends StatelessWidget {
  const ZetaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Content(
      title: 'Zeta',
      subtitleWidget: InkWell(
        onTap: () {
          unawaited(launchUrl(Uri.https('pub.dev', '/packages/zeta_flutter')));
        },
        child: ZetaText.bodyLarge(
          'pub.dev/packages/zds_flutter',
          textColor: ZetaColors.of(context).primary,
        ),
      ),
      content: const Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BulletPointList(
                  content: [
                    BulletPoint(
                      point: 'Cross-platform, curated design system',
                      subPoints: [
                        'Flutter, Web Components',
                      ],
                    ),
                    BulletPoint(point: ''),
                    BulletPoint(
                      point: 'Early alpha release',
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: ZetaDemo(),
            ),
          ),
        ],
      ),
    );
  }
}
