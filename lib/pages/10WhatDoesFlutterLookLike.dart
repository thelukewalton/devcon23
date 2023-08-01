// ignore_for_file: file_names
import 'package:basic/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

import '../components/content.dart';

class WhatDoesFlutterLookLike extends StatelessWidget {
  const WhatDoesFlutterLookLike({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Row(
        children: [
          Expanded(
            child: Content(
              title: 'What does Flutter look like?',
              subtitle: 'main.dart',
              content: Row(
                children: [
                  Flexible(
                    child: Center(
                      child: SizedBox(
                        height: constraints.maxHeight * 0.75,
                        width: constraints.maxHeight * 0.75 / 1.8,
                        child: const ClipRect(child: Example()),
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
                      child: SvgPicture.asset('lib/assets/code.svg'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    },);
  }
}
