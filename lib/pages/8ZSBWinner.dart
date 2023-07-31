// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:presentation/components/bullets.dart';
import 'package:presentation/components/content.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

class ZSBWinner extends StatelessWidget {
  const ZSBWinner({super.key});

  @override
  Widget build(BuildContext context) {
    final ZetaColors colors = ZetaColors.of(context);
    return Content(
      title: 'ZSB Series Printer',
      subtitle: 'The solution: Flutter 🎉',
      leftImage: Image.asset('lib/assets/zsbapp.png').square(100),
      inverse: true,
      content: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(child: ZetaText.bodyLarge('Good', textColor: colors.primary).stack(Dimensions.l)),
                    Expanded(child: ZetaText.bodyLarge('Not so good', textColor: colors.primary).stack(Dimensions.l)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: BulletPointList(
                        content: [
                          BulletPoint(point: 'Cross platform'),
                          BulletPoint(point: 'Developer experience'),
                          BulletPoint(point: 'Great UX'),
                          BulletPoint(point: 'Native features'),
                          BulletPoint(point: 'Future support'),
                        ],
                      ),
                    ),
                    Flexible(
                      child: BulletPointList(
                        content: [
                          BulletPoint(point: 'Waterfall'),
                          BulletPoint(point: 'Accessability'),
                          BulletPoint(point: 'Responsiveness'),
                          BulletPoint(point: 'Minimal UI customization'),
                          BulletPoint(point: 'State management'),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
