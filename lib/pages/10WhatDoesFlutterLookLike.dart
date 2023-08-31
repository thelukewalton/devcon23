import 'package:basic/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vector_graphics/vector_graphics.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

import '../components/content.dart';

class WhatDoesFlutterLookLike extends StatelessWidget {
  const WhatDoesFlutterLookLike({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          children: [
            Expanded(
              child: Content(
                title: 'What does Flutter look like?',
                subtitle: 'Declarative UI',
                content: Row(
                  children: [
                    Flexible(
                      child: Center(
                        child: SizedBox(
                          height: constraints.maxHeight * 0.75,
                          width: constraints.maxHeight * 0.75 / 1.8,
                          child: Container(
                            color: ZetaColors.of(context).black,
                            padding: const EdgeInsets.all(1.0),
                            child: ColoredBox(
                              color: ZetaColors.of(context).background,
                              child: const ClipRect(
                                child: Example(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                          color: ZetaColors.of(context).onSurface,
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: Dimensions.xxxl, vertical: Dimensions.m),
                        child: const SvgPicture(AssetBytesLoader('lib/assets/code.svg.vec')),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
