import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vector_graphics/vector_graphics.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

import '../components/bullets.dart';
import '../components/content.dart';

class SemanticsPage extends StatelessWidget {
  const SemanticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ZetaColors colors = ZetaColors.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        return Content(
          title: 'Accessibility',
          inverse: true,
          subtitle: 'Semantics',
          content: Column(
            children: [
              const BulletPointList(
                content: [
                  BulletPoint(
                    point: 'Elimintating vision barriers',
                    subPoints: ['Content, function, actions, state'],
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(8)),
                                color: colors.onSurface,
                              ),
                              child: SvgPicture(
                                const AssetBytesLoader('lib/assets/builtin.svg.vec'),
                                width: constraints.maxWidth / 3,
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text('Built in Semantics', style: ZetaText.zetaLabelSmall),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(8)),
                                color: colors.onSurface,
                              ),
                              child: SvgPicture(
                                const AssetBytesLoader('lib/assets/MergeSemantics.svg.vec'),
                                width: constraints.maxWidth / 3,
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text('MergeSemantics', style: ZetaText.zetaLabelSmall),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(8)),
                                color: colors.onSurface,
                              ),
                              child: SvgPicture(
                                const AssetBytesLoader('lib/assets/semantics.svg.vec'),
                                width: constraints.maxWidth / 3,
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text('Semantics Widget', style: ZetaText.zetaLabelSmall),
                            const SizedBox(height: 16),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(8)),
                                color: colors.onSurface,
                              ),
                              child: SvgPicture(
                                const AssetBytesLoader('lib/assets/ExcludeSemantics.svg.vec'),
                                width: constraints.maxWidth / 3,
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text('ExcludeSemantics', style: ZetaText.zetaLabelSmall),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
