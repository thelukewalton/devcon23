import 'package:flutter/material.dart';
import '../components/bullets.dart';

import '../components/content.dart';

class OurProcess extends StatelessWidget {
  const OurProcess({super.key});

  @override
  Widget build(BuildContext context) {
    return const Content(
      title: 'Cross platform history',
      content: BulletPointList(
        content: [
          BulletPoint(point: 'Sencha / ExtJs'),
          BulletPoint(point: 'Rhodes'),
          BulletPoint(point: 'PhoneGap / Cordova'),
          BulletPoint(point: 'Electron'),
          BulletPoint(point: 'Enterprise Browser'),
          BulletPoint(point: 'Xamarin'),
          BulletPoint(point: 'PWA'),
        ],
      ),
    );
  }
}
