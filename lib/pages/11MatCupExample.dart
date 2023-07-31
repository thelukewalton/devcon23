// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:cupertino/main.dart';
import 'package:material/main.dart';
import 'package:presentation/components/bullets.dart';
import 'package:presentation/components/svg.dart';

import '../components/content.dart';

class MaterialCupertinoExample extends StatefulWidget {
  const MaterialCupertinoExample({super.key});

  @override
  State<MaterialCupertinoExample> createState() => _MaterialCupertinoExampleState();
}

class _MaterialCupertinoExampleState extends State<MaterialCupertinoExample> {
  @override
  Widget build(BuildContext context) {
    return const Content(
      backgroundOnTop: false,
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
                CaptionedWidget(caption: 'Material (Android)', captionOffset: 20, child: ExampleMaterial()),
                CaptionedWidget(caption: 'Cupertino (iOS)', captionOffset: 20, child: ExampleCupertino()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
