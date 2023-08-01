// ignore_for_file: file_names
import 'package:cupertino/main.dart';
import 'package:flutter/material.dart';
import 'package:material/main.dart';

import '../components/bullets.dart';
import '../components/content.dart';
import '../components/svg.dart';

class MaterialCupertinoExample extends StatefulWidget {
  const MaterialCupertinoExample({super.key});

  @override
  State<MaterialCupertinoExample> createState() => _MaterialCupertinoExampleState();
}

class _MaterialCupertinoExampleState extends State<MaterialCupertinoExample> {
  @override
  Widget build(BuildContext context) {
    return const Content(
      title: 'Core UI',
      subtitle: 'Material and Cupertino',
      content: Row(
        children: [
          Flexible(
            child: BulletPointList(
              content: [
                BulletPoint(point: 'Foundation'),
                BulletPoint(point: 'UI Components', subPoints: ['Adaptive constructors']),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                CaptionedWidget(caption: 'Material (Android)', child: ExampleMaterial()),
                CaptionedWidget(caption: 'Cupertino (iOS)', child: ExampleCupertino()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
