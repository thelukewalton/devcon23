import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

class MySvg extends StatelessWidget {
  final String caption;
  final String asset;
  final bool withFlex;
  const MySvg({super.key, required this.caption, required this.asset, this.withFlex = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: withFlex
            ? [
                Flexible(flex: 9, child: SvgPicture.asset(asset)),
                Flexible(child: ZetaText.labelSmall(caption)),
              ]
            : [
                SvgPicture.asset(asset),
                ZetaText.labelSmall(caption),
              ],
      ),
    );
  }
}
