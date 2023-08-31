import 'package:flutter/material.dart';
import 'package:zeta_flutter/zeta_flutter.dart';
import '../components/bullets.dart';
import '../components/content.dart';

class InnovationDesign extends StatelessWidget {
  const InnovationDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Content(
      title: 'Innovation Design',
      content: const BulletPointList(
        content: [
          BulletPoint(point: 'Award winning products and solutions from concept to production.'),
          BulletPoint(point: ''),
          BulletPoint(point: '7 studios globally'),
          BulletPoint(point: '61 designers, researchers and developers'),
        ],
      ).inlineEnd(Dimensions.xl),
      trailingFlex: 2,
      otherContent: DefaultTextStyle(
        style: ZetaText.zetaTitleMedium.copyWith(
          color: ZetaColors.of(context).cool.shade70,
          fontWeight: FontWeight.w600,
          height: 1,
        ),
        child: Column(
          children: [
            const SizedBox(height: Dimensions.xxl),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ZetaText.bodyXSmall('Customer Design Research'),
                ZetaText.bodyXSmall('Physical Product Design'),
              ],
            ),
            const SizedBox(height: 4),
            Expanded(child: Image.asset('lib/assets/id.png')),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ZetaText.bodyXSmall('Human Factors Engineering'),
                ZetaText.bodyXSmall('User Experience Design'),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
