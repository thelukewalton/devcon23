// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:presentation/components/bullets.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

import '../components/content.dart';

class SemanticsPage extends StatelessWidget {
  const SemanticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Zeta(
      colors: ZetaColors.of(context).copyWith(isDarkMode: true),
      builder: (p0, p1, p2) {
        return const Content(
          title: 'Accessibility',
          subtitle: 'Semantics',
          content: Column(
            children: [
              BulletPointList(
                content: [
                  BulletPoint(
                    point: 'Elimintating vision barriers',
                    subPoints: ['Content, function, actions, state'],
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          // FittedBox(child: CaptionedWidget(asset: 'lib/assets/builtin.svg', caption: 'Built in')),
                          // FittedBox(
                          //     child:
                          //         CaptionedWidget(asset: 'lib/assets/MergeSemantics.svg', caption: 'MergeSemantics')),
                        ],
                      ),
                    ),
                    //TODO: Fix this
                    Expanded(
                      child: Column(
                        children: [
                          // CaptionedWidget(asset: 'lib/assets/semantics.svg', caption: 'Semantics'),
                          // CaptionedWidget(asset: 'lib/assets/ExcludeSemantics.svg', caption: 'ExcludeSemantics'),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
