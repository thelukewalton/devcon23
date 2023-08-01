import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

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
import '../pages/2WhoWeAre.dart';
import '../pages/3CrossPlatformHistory.dart';
import '../pages/4ZSBProblem.dart';
import '../pages/5FutureDivider.dart';
import '../pages/6ReactNative.dart';
import '../pages/7Flutter.dart';
import '../pages/8ZSBWinner.dart';
import '../pages/9HelloFlutter.dart';

class NavWrapper extends StatefulWidget {
  final Widget child;

  const NavWrapper({super.key, required this.child});

  @override
  State<NavWrapper> createState() => _NavWrapperState();
}

class _NavWrapperState extends State<NavWrapper> {
  final FocusNode _focusNode = FocusNode();
  // int _currentColors = 1;
  double _zoom = 1.3;
  Future<void> firstPage() async => GoRouter.of(context).pushReplacement('/1');
  Future<void> lastPage() async => GoRouter.of(context).pushReplacement('/${routes.length}');

  @override
  Widget build(BuildContext context) {
    final int pageNumber = int.parse(GoRouter.of(context).location.split('/').last);
    final int pagesTotal = routes.length;
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
          // if (value.physicalKey == PhysicalKeyboardKey.arrowUp) firstPage();
          // if (value.physicalKey == PhysicalKeyboardKey.arrowDown) lastPage();
          // if (value.physicalKey == PhysicalKeyboardKey.keyQ) {
          //   setState(() => currentColors = iterateColors(context, currentColors));
          // }
        }
      },
      child: DefaultTextStyle(
        style: ZetaText.zetaBodyMedium.copyWith(color: ZetaColors.of(context).textDefault),
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: _zoom),
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
                              IconButton(
                                icon: const Icon(Icons.remove_circle_outline),
                                onPressed: () => setState(() => _zoom = _zoom - 0.1),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add_circle_outline),
                                onPressed: () => setState(() => _zoom = _zoom + 0.1),
                              ),
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
      ),
    );
  }
}

final routes = [
  const Page1(),
  const WhoWeAre(),
  const OurProcess(),
  const ZSBProblem(),
  const FutureOfCrossPlatform(),
  const ReactNative(),
  const Flutter(),
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
            transitionDuration: const Duration(milliseconds: 200),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: animation.drive(
                  Tween<Offset>(
                    begin: Offset.zero,
                    // begin: const Offset(0.5, 0),
                    end: Offset.zero,
                  ).chain(CurveTween(curve: Curves.easeIn)),
                ),
                child: child,
              );
            },
          ),
        ),
      )
      .toList(),
);
