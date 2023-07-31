// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:presentation/components/bullets.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

import '../components/content.dart';

class ZetaPage extends StatelessWidget {
  const ZetaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Content(
      title: 'Zeta',
      subtitle: 'pub.dev/packages/zeta_flutter',
      content: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BulletPointList(
                  content: [
                    BulletPoint(point: 'Cross-platform, future design system'),
                    BulletPoint(point: 'Formal, standardized set of components'),
                    BulletPoint(point: 'Work in progress'),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
                child: Text(
              'Zeta',
              style: ZetaText.zetaDisplayLarge.copyWith(
                fontFamily: 'IBM Plex Sans',
                fontWeight: FontWeight.w400,
                fontSize: 160,
              ),
            )).stack(200),
            //TODO: embed some content
          ),
        ],
      ),
    );
  }
}
