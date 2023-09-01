import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vector_graphics/vector_graphics.dart';
import 'package:zeta_flutter/zeta_flutter.dart';
import '../components/bullets.dart';

import '../components/content.dart';

class ReactNativeOrFlutter extends StatelessWidget {
  const ReactNativeOrFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Content(
          title: 'React Native or Flutter?',
          inverse: true,
          content: Column(
            children: [
              SizedBox(height: constraints.maxHeight * 0.02),
              Row(
                children: [
                  SizedBox(width: constraints.maxWidth * 0.1),
                  Expanded(
                    child: Column(
                      children: [
                        SvgPicture(
                          const AssetBytesLoader('lib/assets/react.svg.vec'),
                          height: constraints.maxHeight * 0.15,
                        ).inlineEnd(constraints.maxWidth * 0.1),
                        const SizedBox(height: Dimensions.l),
                        const BulletPointList(
                          isDark: true,
                          content: [
                            BulletPoint(point: 'JavaScript', subPoints: ['Dynamically typed']),
                            BulletPoint(point: 'Native components', subPoints: ['npm / React Native Directory']),
                            BulletPoint(point: 'Popularity'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: constraints.maxWidth * 0.1),
                  Expanded(
                    child: Column(
                      children: [
                        FlutterLogo(
                          size: constraints.maxHeight * 0.15,
                        ).inlineEnd(constraints.maxWidth * 0.1),
                        const SizedBox(height: Dimensions.l),
                        const BulletPointList(
                          isDark: true,
                          content: [
                            BulletPoint(point: 'Dart', subPoints: ['Statically typed']),
                            BulletPoint(point: 'Rich core libraries', subPoints: ['pub.dev']),
                            BulletPoint(point: 'Growing community'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: constraints.maxWidth * 0.1),
                ],
              ),
              SizedBox(height: constraints.maxHeight * 0.04),
              ZetaText('Developer experience...', textColor: Theme.of(context).colorScheme.primary),
            ],
          ),
        );
      },
    );
  }
}
