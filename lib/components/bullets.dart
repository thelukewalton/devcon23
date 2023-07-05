import 'package:flutter/material.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

class BulletPointList extends StatelessWidget {
  final List<BulletPoint> content;
  const BulletPointList({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: content.map((e) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (e.point.isNotEmpty) const _Bullet(),
                ZetaText.bodyLarge(
                  e.point,
                  textColor: ZetaColors.of(context).textDefault,
                ),
              ],
            ),
            ...(e.subpoints
                .map((e) => Row(
                      children: [
                        const _Bullet(isSubPoint: true),
                        ZetaText(e),
                      ],
                    ))
                .toList())
          ],
        );
        //TODO: optimize away one of the columns here
//TODO: allow for widgets as children, not just bullet points
      }).toList(),
    );
  }
}

class BulletPoint {
  final String point;
  final List<String> subpoints;

  BulletPoint({required this.point, this.subpoints = const []});
}

class _Bullet extends StatelessWidget {
  final bool isSubPoint;

  const _Bullet({this.isSubPoint = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: isSubPoint ? BoxShape.rectangle : BoxShape.circle, //TODO: Make sub point a line
        color: isSubPoint ? ZetaColors.of(context).textDefault : ZetaColors.of(context).primary,
      ),
      margin: EdgeInsets.only(right: 16, top: 2, left: isSubPoint ? 16 : 0),
      width: 6,
      height: isSubPoint ? 1 : 6,
    );
  }
}
