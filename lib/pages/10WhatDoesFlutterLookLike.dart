import 'package:basic/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';

import 'package:flutter_highlight/themes/atom-one-dark-reasonable.dart';
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
                // inverse: true,
                title: 'What does Flutter look like?',
                subtitle: 'Declarative UI',
                content: Row(
                  children: [
                    Flexible(
                      child: Center(
                        child: SizedBox(
                          height: constraints.maxHeight * 0.65,
                          width: constraints.maxHeight * 0.75 / 1.8,
                          child: Container(
                            color: ZetaColors.of(context).black,
                            padding: const EdgeInsets.all(1.0),
                            child: ColoredBox(
                              color: ZetaColors.of(context).background,
                              child: const ClipRect(child: Example()),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                          color: ZetaColors.of(context).onSurface,
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: Dimensions.xxxl, vertical: Dimensions.m),
                        // child: const SvgPicture(AssetBytesLoader('lib/assets/code.svg.vec')),
                        child: HighlightView(
                          '''
 1 import 'package:flutter/widgets.dart';
 2  
 3 void main() => runApp(const Example());
 4 
 5 class Example extends StatelessWidget {
 6  const Example({super.key});
 7  
 8  @override
 9  Widget build(BuildContext context) {
10   return Column(
11     mainAxisAlignment: MainAxisAlignment.spaceAround,
12     children: [
13      const Text('Hello Flutter!'),
14      Image.asset('assets/dash.png', height: 200),
15     ],
16    );
17   }
18  }
                        ''',
                          textStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontFamily: 'IBMPlexMono',
                                color: ZetaColorBase.greyCool.shade30,
                              ),
                          language: 'dart',
                          theme: atomOneDarkReasonableTheme,
                          padding: const EdgeInsets.all(16),
                        ),
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
