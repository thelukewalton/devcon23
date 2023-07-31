// ignore_for_file: file_names
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
              BigIcon(icon: Symbols.hearing_disabled, text: 'Hearing'),
              BigIcon(icon: Symbols.accessible, text: 'Physical'),
              BigIcon(icon: Symbols.visibility_off, text: 'Visual'),
              BigIcon(icon: Symbols.psychology, text: 'Cognitive'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BigIcon(icon: Symbols.elderly, text: 'Age'),
              BigIcon(icon: Symbols.factory, text: 'Situational'),
              BigIcon(icon: Symbols.language, text: 'Culture'),
            ],
          ),
        ],
      ),
    );
  }
}

class BigIcon extends StatelessWidget {
  final IconData icon;
  final String text;

  const BigIcon({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: ZetaColors.of(context).textDefault, size: 128, weight: 300),
        const SizedBox(height: 16),
        ZetaText.bodyMedium(text),
      ],
    );
  }
}
