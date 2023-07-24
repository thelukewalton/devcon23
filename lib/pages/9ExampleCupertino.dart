// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cupertino/main.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

import '../components/content.dart';

class WhatDoesFlutterLookLikeCupertino extends StatelessWidget {
  const WhatDoesFlutterLookLikeCupertino({super.key});

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
                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                        child: SizedBox(
                          width: constraints.maxWidth * 0.22,
                          height: constraints.maxWidth * 0.38,
                          child: const ExampleCupertino(),
                        ),
                      ),
                    ).stack(Dimensions.xxxl),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: colors.onSurface,
                        borderRadius: const BorderRadius.all(Radius.circular(28)),
                      ),
                      child: SvgPicture.asset('lib/assets/code.svg'),
                    ).inline(Dimensions.s).stack(Dimensions.xxxl),
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
