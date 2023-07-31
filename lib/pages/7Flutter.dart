// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:presentation/components/bullets.dart';
import 'package:presentation/components/content.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

class Flutter extends StatelessWidget {
  const Flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Content(
        title: 'Flutter',
        subtitle: 'Google',
        leftImage: Padding(
          padding: EdgeInsets.all(constraints.maxWidth * 0.1),
          child: const FlutterLogo(),
        ),
        content: const BulletPointList(
          content: [
            BulletPoint(point: 'Dart', subPoints: ['Statically typed']),
            BulletPoint(point: 'Developer experience'),
            BulletPoint(point: 'Rich core libraries'),
            BulletPoint(point: 'pub.dev'),
            BulletPoint(point: 'Growing community'),
          ],
        ),
      );
    });
  }
}
