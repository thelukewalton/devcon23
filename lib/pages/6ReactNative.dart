// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../components/bullets.dart';

import '../components/content.dart';

class ReactNative extends StatelessWidget {
  const ReactNative({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Content(
          title: 'React Native',
          subtitle: 'Meta',
          content: const BulletPointList(
            content: [
              BulletPoint(
                point: 'JavaScript / TypeScript',
                // subpoints: ['Dynamically / strongly typed'],
              ),
              BulletPoint(point: 'Native components'),
              BulletPoint(point: 'npm / React Native components'),
              BulletPoint(point: 'Popularity'),
            ],
          ),
          leftImage: Padding(
            padding: EdgeInsets.all(constraints.maxWidth * 0.1),
            child: SvgPicture.asset('lib/assets/react.svg'),
          ),
        );
      },
    );
  }
}
