import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

import '../components/content.dart';

class Accessibility extends StatelessWidget {
  const Accessibility({super.key});

  @override
  Widget build(BuildContext context) {
    return const Content(
      title: 'Accessibility',
      subtitle: 'Make experience great for all users',
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BigIcon(icon: Symbols.hearing_disabled, text: 'Hearing', isOn: false),
              BigIcon(icon: Symbols.accessible, text: 'Physical', isOn: false),
              BigIcon(icon: Symbols.visibility_off, text: 'Visual', isOn: false),
              BigIcon(icon: Symbols.psychology, text: 'Cognitive', isOn: false),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BigIcon(icon: Symbols.elderly, text: 'Age', isOn: false),
              BigIcon(icon: Symbols.factory, text: 'Situational', isOn: false),
              BigIcon(icon: Symbols.language, text: 'Culture', isOn: false),
            ],
          ),
        ],
      ),
    );
  }
}