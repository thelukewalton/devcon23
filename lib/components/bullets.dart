import 'package:flutter/material.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

class BulletPointList extends StatelessWidget {
  final List<dynamic> content;
  final bool isMain;
  const BulletPointList({super.key, required this.content, this.isMain = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: content
          .map((e) => e is BulletPoint
              ? _renderPoint(e, context)
              : e is Widget
                  ? e
                  : const SizedBox())
          .expand<Widget>((element) => element as Iterable<Widget>)
          .toList(),
    );
  }

  List<Widget> _renderPoint(BulletPoint e, BuildContext context) {
    return [
      Row(
        children: [
          if (e.point.isNotEmpty) const _Bullet(),
          Text(
            e.point,
            style: (isMain ? ZetaText.zetaBodyLarge : ZetaText.zetaBodyMedium).copyWith(height: 2),
          ),
        ],
      ),
      ...(e.subpoints.map((e) => Row(children: [const _Bullet(isSubPoint: true), ZetaText(e)])).toList())
    ];
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
        shape: isSubPoint ? BoxShape.rectangle : BoxShape.circle,
        color: isSubPoint ? ZetaColors.of(context).textDefault : ZetaColors.of(context).primary,
      ),
      margin: EdgeInsets.only(right: 16, top: 2, left: isSubPoint ? 16 : 0),
      width: 6,
      height: isSubPoint ? 1 : 6,
    );
  }
}
