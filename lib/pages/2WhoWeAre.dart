// ignore_for_file: file_names
import 'package:flutter/material.dart';
import '../components/bullets.dart';
import '../components/content.dart';

class WhoWeAre extends StatelessWidget {
  const WhoWeAre({super.key});

  @override
  Widget build(BuildContext context) {
    return Content(
      title: 'Who we are',
      content: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Flexible(
            flex: 2,
            child: BulletPointList(
              content: [
                BulletPoint(point: 'Front End Development', subPoints: ['User Experience', 'Innovation and Design']),
                BulletPoint(point: 'Worldwide team'),
                BulletPoint(point: 'Design → development'),
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: Image.asset(
              'lib/assets/ID.png',
            ),
          ),
          const Flexible(child: SizedBox()),
        ],
      ),
    );
  }
}
