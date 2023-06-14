import 'package:flutter/material.dart';
import 'package:presentation/components/content.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    final ZetaColors colors = ZetaColors.of(context);

    return Content(
      title: 'Schedule',
      subtitle: 'Optional Subtitle',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ZetaText.bodyLarge(
            '1. Intro',
            textColor: colors.textDefault,
          ),
          ZetaText.bodyLarge(
            '2. Who Flutter',
            textColor: colors.textDefault,
          ),
          ZetaText.bodyLarge(
            '3. What Flutter',
            textColor: colors.textDefault,
          ),
          ZetaText.bodyLarge(
            '4. When Flutter',
            textColor: colors.textDefault,
          ),
          ZetaText.bodyLarge(
            '5. Where Flutter',
            textColor: colors.textDefault,
          ),
          ZetaText.bodyLarge(
            '6. Why Flutter',
            textColor: colors.textDefault,
          ),
          ZetaText.bodyLarge(
            '7. Fire eating',
            textColor: colors.textDefault,
          ),
          ZetaText.bodyLarge(
            '8. Outro',
            textColor: colors.textDefault,
          ),
        ],
      ),
    );
  }
}
