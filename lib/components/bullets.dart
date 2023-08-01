import 'package:flutter/material.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

class BulletPointList extends StatelessWidget {
  final List<dynamic> _content;
  const BulletPointList({super.key, required List<dynamic> content}) : _content = content;

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
              style: ZetaText.zetaBodyLarge.copyWith(
                color: e.isCode ? ZetaColors.of(context).surface : null,
                fontFamily: e.isCode ? 'IBMPlexMono' : null,
                height: e.isCode ? 1.4 : 2,
              ),
            ),
          ),
        ],
      ),
      ...e.subPoints
          .map((String e) => Row(children: [const _Bullet(isSubPoint: true), Text(e, style: ZetaText.zetaBodyMedium)]))
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
  final bool _isSubPoint;

  const _Bullet({bool isSubPoint = false}) : _isSubPoint = isSubPoint;

  @override
  Widget build(BuildContext context) {
    if (_isSubPoint) {
      return const Text('        ― ');
    }
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: ZetaColors.of(context).primary),
      margin: const EdgeInsets.only(right: 16, top: 16),
      width: 6,
      height: 6,
    );
  }
}
