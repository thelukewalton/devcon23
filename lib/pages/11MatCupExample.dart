import 'package:cupertino/main.dart';
import 'package:flutter/material.dart';
import 'package:material/main.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

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
    return LayoutBuilder(
      builder: (context, constriants) {
        return const Content(
          title: 'Core UI',
          subtitle: 'Material and Cupertino',
          content: BulletPointList(
            content: [
              BulletPoint(point: 'Foundation'),
              BulletPoint(point: 'UI Components', subPoints: ['Adaptive constructors']),
            ],
          ),
          otherContent: Column(
            children: [
              SizedBox(height: Dimensions.m),
              Expanded(
                child: Row(
                  children: [
                    CaptionedWidget(caption: 'Material (Android)', child: ExampleMaterial()),
                    CaptionedWidget(caption: 'Cupertino (iOS)', child: ExampleCupertino()),
                    SizedBox(width: Dimensions.l),
                  ],
                ),
              ),
              SizedBox(height: Dimensions.l),
            ],
          ),
        );
      },
    );
  }
}
