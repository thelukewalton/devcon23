import 'package:flutter/material.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

import '../main.dart';

class BulletPointList extends StatelessWidget {
  final List<dynamic> _content;
  final bool isDark;
  const BulletPointList({super.key, required List<dynamic> content, this.isDark = false}) : _content = content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _content
          .map(
            (e) => e is BulletPoint
                ? _renderPoint(e, context)
                : e is Widget
                    ? e
                    : const SizedBox(),
          )
          .expand<Widget>((Object element) => element as Iterable<Widget>)
          .toList(),
    );
  }

  List<Widget> _renderPoint(BulletPoint e, BuildContext context) {
    return [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (e.point.isNotEmpty) _Bullet(isCode: e.isCode),
          Flexible(
            child: Container(
              decoration: e.isCode
                  ? BoxDecoration(
                      color: ZetaColors.of(context).onSurface,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    )
                  : null,
              margin: e.isCode
                  ? const EdgeInsets.only(top: 4)
                  : EdgeInsets.only(left: 8 * (MyAppState().of(context)?.scaleMultiplier ?? 1)),
              padding: e.isCode ? const EdgeInsets.symmetric(horizontal: 4) : null,
              child: ZetaText(
                e.point,
                textColor: (e.isCode || isDark) ? ZetaColors.of(context).surface : null,
                style: ZetaText.zetaBodySmall.copyWith(fontFamily: e.isCode ? 'IBMPlexMono' : null, height: 1.4),
              ),
            ),
          ),
        ],
      ),
      ...e.subPoints.map(
        (String e) => Row(
          children: [
            const _Bullet(isSubPoint: true, isCode: false),
            ZetaText.bodyXSmall(
              e,
              textColor: isDark ? ZetaColors.of(context).surface : null,
            ),
          ],
        ),
      ),
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
  final bool isCode;

  const _Bullet({this.isSubPoint = false, required this.isCode});

  @override
  Widget build(BuildContext context) {
    if (isSubPoint) {
      return const Text(
        '        ― ',
        style: TextStyle(height: 0.8),
      );
    }
    return Text(
      '•',
      style: ZetaText.zetaBodyLarge.copyWith(color: ZetaColors.of(context).primary, height: isCode ? 1.4 : 1.6),
    );
  }
}
