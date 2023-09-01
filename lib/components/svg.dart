import 'package:flutter/material.dart';

import 'package:zeta_flutter/zeta_flutter.dart';

class CaptionedWidget extends StatelessWidget {
  final String caption;
  final Widget child;
  final double captionOffset;
  final bool isExpanded;
  const CaptionedWidget({
    super.key,
    required this.caption,
    required this.child,
    this.captionOffset = 20,
    this.isExpanded = true,
  });

  @override
  Widget build(BuildContext context) {
    final column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: child),
        Padding(padding: EdgeInsets.only(left: captionOffset), child: ZetaText.labelSmall(caption)),
      ],
    );
    if (isExpanded) {
      return Expanded(child: column);
    } else {
      return column;
    }
  }
}
