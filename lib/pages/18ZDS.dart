import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

import '../components/bullets.dart';
import '../components/content.dart';
import '../components/zds_demo.dart';

class ZDS extends StatelessWidget {
  const ZDS({super.key});

  @override
  Widget build(BuildContext context) {
    return Content(
      title: 'ZDS Flutter',
      subtitleWidget: InkWell(
        onTap: () {
          unawaited(launchUrl(Uri.https('pub.dev', '/packages/zds_flutter')));
        },
        child: ZetaText.bodyLarge(
          'pub.dev/packages/zds_flutter',
          textColor: ZetaColors.of(context).primary,
        ),
      ),
      content: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BulletPointList(
                  content: [
                    BulletPoint(point: 'Current design components'),
                    BulletPoint(point: 'Production tested'),
                  ],
                ),
              ],
            ),
          ),
          Flexible(flex: 4, child: ZDSDemo()),
        ],
      ),
    );
  }
}
