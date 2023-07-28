// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:presentation/components/bullets.dart';
import 'package:presentation/components/content.dart';

class Flutter extends StatelessWidget {
  const Flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Content(
        title: 'Flutter',
        subtitle: 'Google',
        content: BulletPointList(
          content: [
            BulletPoint(point: 'Dart', subpoints: ['Statically typed']),
            BulletPoint(point: 'Developer experience'),
            BulletPoint(point: 'Rich core libraries'),
            BulletPoint(point: 'pub.dev'),
            BulletPoint(point: 'Growing community'),
          ],
        ));
  }
}
//TODO: style slide