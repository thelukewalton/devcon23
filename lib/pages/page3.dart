import 'package:flutter/material.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

import '../components/content.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    final ZetaColors colors = ZetaColors.of(context);

    return Content(
      title: 'Intro',
      subtitle: 'Luke Walton, Front End Developer',
      content: ZetaGrid(
        col: 2,
        children: [
          ZetaText.bodyLarge(
            'Innovation and Design',
            textColor: colors.textDefault,
          ),
          ZetaText.bodyLarge(
            'London',
            textColor: colors.textDefault,
          ),
          ZetaText.bodyLarge(
            'Flutter',
            textColor: colors.textDefault,
          ),
        ],
      ),
    );
  }
}
