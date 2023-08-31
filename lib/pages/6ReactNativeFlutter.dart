import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vector_graphics/vector_graphics.dart';
import 'package:zeta_flutter/zeta_flutter.dart';
import '../components/bullets.dart';

import '../components/content.dart';

class ReactNative extends StatelessWidget {
  const ReactNative({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Content(
          title: 'React Native or Flutter?',
          inverse: true,
          content: Column(
            children: [
              SizedBox(height: constraints.maxHeight * 0.05),

              Row(
                children: [
                  SizedBox(width: constraints.maxWidth * 0.1),
                  Expanded(
                    // flex: 2,
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
                            BulletPoint(
                              point: 'JavaScript / TypeScript',
                              subPoints: ['Dynamically / strongly typed'],
                            ),
                            BulletPoint(point: 'Native components'),
                            BulletPoint(point: 'npm / React Native Directory'),
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
                            BulletPoint(
                              point: 'Dart',
                              subPoints: ['Statically typed'],
                            ),
                            BulletPoint(point: 'Rich core libraries'),
                            BulletPoint(point: 'pub.dev'),
                            BulletPoint(point: 'Growing community'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: constraints.maxWidth * 0.1)
                ],
              ),
              // Text('developer experience')
            ],
          ),
          // leftImage: Padding(
          //   padding: EdgeInsets.all(constraints.maxWidth * 0.1),
          //   child: const SvgPicture(AssetBytesLoader('lib/assets/react.svg.vec')),
          // ),
        );
      },
    );
  }
}
