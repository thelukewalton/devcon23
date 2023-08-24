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
        return Content(
          title: 'Core UI',
          subtitle: 'Material and Cupertino',
          content: const BulletPointList(
            content: [
              BulletPoint(point: 'Foundation'),
              BulletPoint(point: 'UI Components', subPoints: ['Adaptive constructors']),
            ],
          ),
          otherContent: Column(
            children: [
              const SizedBox(height: Dimensions.m),
              Expanded(
                child: Row(
                  children: [
                    CaptionedWidget(
                      caption: 'Material (Android)',
                      child: ExampleMaterial(
                        colors: ZetaColors.of(context),
                      ),
                    ),
                    const CaptionedWidget(caption: 'Cupertino (iOS)', child: ExampleCupertino()),
                    const SizedBox(width: Dimensions.l),
                  ],
                ),
              ),
              const SizedBox(height: Dimensions.l),
            ],
          ),
        );
      },
    );
  }
}
