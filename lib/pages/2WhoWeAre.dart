// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:presentation/components/bullets.dart';
import 'package:presentation/components/content.dart';

class WhoWeAre extends StatelessWidget {
  const WhoWeAre({super.key});

  @override
  Widget build(BuildContext context) {
    return Content(
      title: 'Who we are',
      content: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            flex: 2,
            child: BulletPointList(
              content: [
                BulletPoint(point: 'Front End Development', subpoints: ['User Experience', 'Innovation and Design']),
                BulletPoint(point: 'Worldwide team'),
                BulletPoint(point: 'Design → development'),
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: FittedBox(
              child: Image.asset(
                'lib/assets/ID.png',
              ),
            ),
          ),
          const Flexible(child: SizedBox()),
        ],
      ),
    );
  }
}
