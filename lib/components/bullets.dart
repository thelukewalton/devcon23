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
          Container(
            decoration: e.isCode
                ? BoxDecoration(
                    color: ZetaColors.of(context).onSurface,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  )
                : null,
            margin: e.isCode ? const EdgeInsets.only(top: 4) : null,
            padding: e.isCode ? const EdgeInsets.symmetric(horizontal: 4) : null,
            child: Text(
              e.point,
              style: ((isMain ? ZetaText.zetaBodyLarge : ZetaText.zetaBodyMedium).copyWith(
                color: e.isCode ? ZetaColors.of(context).surface : null,
                fontFamily: e.isCode ? 'IBMPlexMono' : null,
                height: e.isCode ? 1.4 : 2,
              )),
            ),
          ),
        ],
      ),
      ...(e.subPoints.map((e) => Row(children: [const _Bullet(isSubPoint: true), ZetaText(e)])).toList())
    ];
  }
}

class BulletPoint {
  final String point;
  final List<String> subPoints;
  final bool isCode;

  const BulletPoint({required this.point, this.subPoints = const [], this.isCode = false});
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
      margin: EdgeInsets.only(right: 16, top: isSubPoint ? 8 : 16, left: isSubPoint ? 16 : 0),
      width: 6,
      height: isSubPoint ? 1 : 6,
    );
  }
}
