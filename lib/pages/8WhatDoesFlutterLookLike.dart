// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

import '../components/content.dart';
import '../components/example.dart';

class WhatDoesFlutterLookLike extends StatelessWidget {
  const WhatDoesFlutterLookLike({super.key});

  @override
  Widget build(BuildContext context) {
    final ZetaColors colors = ZetaColors.of(context);
    return LayoutBuilder(builder: (context, constraints) {
      return Row(
        children: [
          Expanded(
            child: Content(
              title: 'What does Flutter look like?',
              content: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(28)),
                        child: SizedBox(
                          width: constraints.maxWidth * 0.22,
                          height: constraints.maxWidth * 0.38,
                          child: const Example(),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: colors.onSurface,
                        borderRadius: const BorderRadius.all(Radius.circular(28)),
                      ),
                      child: SvgPicture.asset('lib/assets/code.svg'),
                    ).square(Dimensions.l).squish(Dimensions.xl),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
