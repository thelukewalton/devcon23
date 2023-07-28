// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:presentation/components/bullets.dart';

import '../components/content.dart';

class ReactNative extends StatelessWidget {
  const ReactNative({super.key});

  @override
  Widget build(BuildContext context) {
    return Content(
      title: 'React Native',
      subtitle: 'Meta',
      content: BulletPointList(content: [
        BulletPoint(
          point: 'JavaScript / TypeScript',
          subpoints: ['Dynamically / strongly typed'],
        ),
        BulletPoint(point: 'Native components'),
        BulletPoint(point: 'npm / React Native components'),
        BulletPoint(point: 'Popularity'),
      ]),
    );
  }
}
//TODO: style slide
