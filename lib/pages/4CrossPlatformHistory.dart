import 'package:flutter/material.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

import '../components/content.dart';

class CrossPlatformHistory extends StatelessWidget {
  const CrossPlatformHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final ZetaColors colors = ZetaColors.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        return Content(
          title: 'Cross platform history',
          content: Column(
            children: [
              ColoredBox(
                color: colors.black,
                child: Row(
                  children: [
                    Expanded(child: ZetaText('WebView with APIs', textColor: colors.white).inlineStart(Dimensions.l)),
                    const SizedBox(width: 1),
                    Expanded(child: ZetaText('Compile to native', textColor: colors.white).inlineStart(Dimensions.l)),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(constraints.maxWidth * 0.02),
                        child: Image.asset('lib/assets/webviews.png'),
                      ),
                    ),
                    Container(color: colors.cool.shade90, width: 1),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(constraints.maxWidth * 0.02),
                        child: Image.asset('lib/assets/nativeish.png'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: constraints.maxHeight * 0.08),
            ],
          ),
        );
      },
    );
  }
}
