import 'package:flutter/widgets.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

class BigIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isOn;

  const BigIcon({super.key, required this.icon, required this.text, this.isOn = true});

  @override
  Widget build(BuildContext context) {
    final ZetaColors colors = ZetaColors.of(context);
    return Column(
      children: [
        Icon(icon, color: isOn ? colors.textDefault : colors.surface, size: 128, weight: 300),
        const SizedBox(height: 16),
        if (isOn) ZetaText.bodyMedium(text),
      ],
    );
  }
}
