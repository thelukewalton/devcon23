import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

import '../main.dart';
import '../pages/10WhatDoesFlutterLookLike.dart';
import '../pages/11MatCupExample.dart';
import '../pages/12TMWFM.dart';
import '../pages/13Acessability.dart';
import '../pages/14AAA.dart';
import '../pages/15Semantics.dart';
import '../pages/16NextSteps.dart';
import '../pages/17Future.dart';
import '../pages/18ZDS.dart';
import '../pages/19Zeta.dart';
import '../pages/1page1.dart';
import '../pages/20End.dart';
import '../pages/2ID.dart';
import '../pages/3ZSBProblem.dart';
import '../pages/4CrossPlatformHistory.dart';
import '../pages/5FutureDivider.dart';
import '../pages/6ReactNativeFlutter.dart';

import '../pages/8ZSBWinner.dart';
import '../pages/9HelloFlutter.dart';

const String scaleKey = 'scale';

class NavWrapper extends StatefulWidget {
  final Widget child;

  const NavWrapper({super.key, required this.child});

  @override
  State<NavWrapper> createState() => _NavWrapperState();
}

class _NavWrapperState extends State<NavWrapper> {
  final FocusNode _focusNode = FocusNode();
  bool showingDialog = false;

  Future<void> firstPage() async => GoRouter.of(context).pushReplacement('/1');
  Future<void> lastPage() async => GoRouter.of(context).pushReplacement('/${routes.length}');

  @override
  Widget build(BuildContext context) {
    final int pageNumber = int.parse(GoRouter.of(context).location.split('/').last);
    final int pagesTotal = routes.length;
    final MyAppState state = MyAppState().of(context)!;

    Future<void> nextPage() async {
      if (pageNumber != pagesTotal) {
        unawaited(GoRouter.of(context).push('/${pageNumber + 1}'));
      }
    }

    void prevPage() {
      if (pageNumber != 1) GoRouter.of(context).pop();
    }

    FocusScope.of(context).requestFocus(_focusNode);
    return KeyboardListener(
      focusNode: _focusNode,
      onKeyEvent: (value) async {
        if (value is KeyUpEvent) {
          if (value.physicalKey == PhysicalKeyboardKey.arrowLeft) prevPage();
          if (value.physicalKey == PhysicalKeyboardKey.arrowRight) unawaited(nextPage());
          if (value.physicalKey == PhysicalKeyboardKey.f12 && !showingDialog) {
            showingDialog = true;
            await showDialog<void>(
              context: context,
              builder: (context) {
                return Dialog(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const ZetaText.titleLarge('Developer options'),
                        const SizedBox(height: 40),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('Scale'),
                            const SizedBox(width: 40),
                            IconButton(
                              icon: const Icon(Icons.remove_circle_outline),
                              onPressed: () => setState(() => state.scaleMultiplier = state.scaleMultiplier - 0.1),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add_circle_outline),
                              onPressed: () => setState(() => state.scaleMultiplier = state.scaleMultiplier + 0.1),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
            final SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setDouble(scaleKey, state.scaleMultiplier);
            showingDialog = false;
          }
          // if (value.physicalKey == PhysicalKeyboardKey.arrowUp) firstPage();
          // if (value.physicalKey == PhysicalKeyboardKey.arrowDown) lastPage();
          // if (value.physicalKey == PhysicalKeyboardKey.keyQ) {
          //   setState(() => currentColors = iterateColors(context, currentColors));
          // }
        }
      },
      // child: DefaultTextStyle(
      // style: ZetaText.zetaBodyMedium.copyWith(color: ZetaColors.of(context).textDefault),
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: state.scaleMultiplier),
        // child: GestureDetector(TODO (thelukewalton): work this out with demos
        //   onTap: nextPage,
        //   onSecondaryTap: prevPage,
        child: Stack(
          children: [
            Positioned(top: 0, bottom: 0, left: 0, right: 0, child: widget.child),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Material(
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(Dimensions.m),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ZetaText.labelSmall(
                        pageNumber == 1 || pageNumber == pagesTotal ? '' : 'ZEBRA TECHNOLOGIES',
                        textColor: ZetaColors.of(context).textSubtle.withOpacity(0.5),
                        fontSize: 8,
                      ),
                      IconTheme(
                        data: IconThemeData(color: ZetaColors.of(context).textSubtle.withOpacity(0.8)),
                        child: Row(
                          children: [
                            const SizedBox(width: Dimensions.xxl),
                            ZetaText.labelSmall(
                              '$pageNumber/$pagesTotal',
                              fontSize: 8,
                              //, ${colors[currentColors == 0 ? colors.length - 1 : currentColors - 1].name}',
                              textColor: ZetaColors.of(context).textSubtle.withOpacity(0.8),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        // ),
      ),
      // ),
    );
  }
}

final routes = [
  const Page1(),
  const InnovationDesign(),
  const ZSBProblem(),
  const OurProcess(),
  const FutureOfCrossPlatform(),
  const ReactNative(),
  const ZSBSolution(),
  const HelloFlutter(),
  const WhatDoesFlutterLookLike(),
  const MaterialCupertinoExample(),
  const TMWFM(),
  const Accessibility(),
  const AAA(),
  const SemanticsPage(),
  const NextSteps(),
  const FuturePage(),
  const ZDS(),
  const ZetaPage(),
  const End(),
];

final GoRouter router = GoRouter(
  initialLocation: '/1',
  routes: routes
      .mapIndexed(
        (index, page) => GoRoute(
          path: '/${index + 1}',
          pageBuilder: (context, state) => CustomTransitionPage<void>(
            child: NavWrapper(child: page),
            transitionDuration: const Duration(milliseconds: 400),
            maintainState: false,
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child);
            },
          ),
        ),
      )
      .toList(),
);
