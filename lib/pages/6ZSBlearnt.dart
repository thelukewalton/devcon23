// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:presentation/components/bullets.dart';
import 'package:presentation/components/content_alt.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

class ZSBLearnt extends StatelessWidget {
  const ZSBLearnt({super.key});

  @override
  Widget build(BuildContext context) {
    final ZetaColors colors = ZetaColors.of(context);
    return ContentAlt(
      title: 'ZSB Series Printer',
      otherContent: Image.asset('lib/assets/zsbapp.jpg').square(100),
      content: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ZetaText.bodyLarge('Good', textColor: colors.primary).stack(Dimensions.l),
                    ),
                    Expanded(
                      child: ZetaText.bodyLarge(
                        'Not so good',
                        textColor: colors.primary,
                      ).stack(Dimensions.l),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: BulletPointList(
                        content: [
                          BulletPoint(point: 'App delivered on time'),
                          BulletPoint(point: 'Small codebase'),
                          BulletPoint(point: 'Smooth 60fps'),
                          BulletPoint(point: 'Native integration'),
                          BulletPoint(point: ''),
                        ],
                      ),
                    ),
                    Flexible(
                      child: BulletPointList(
                        content: [
                          BulletPoint(point: 'Localizations'),
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
