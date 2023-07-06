import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

import '../pages/page1.dart';
import '../pages/page2.dart';
import '../pages/page3.dart';
import '../pages/page4.dart';
import '../pages/page5.dart';
import '../pages/page6.dart';
import '../pages/page7.dart';
import '../pages/pageX.dart';
import 'colors.dart';

class NavWrapper extends StatefulWidget {
  final Widget child;

  const NavWrapper({super.key, required this.child});

  @override
  State<NavWrapper> createState() => _NavWrapperState();
}

class _NavWrapperState extends State<NavWrapper> {
  final FocusNode focusNode = FocusNode();
  int currentColors = 1;

  void firstPage() => GoRouter.of(context).pushReplacement('/1');
  void lastPage() => GoRouter.of(context).pushReplacement('/${routes.length}');

  @override
  Widget build(BuildContext context) {
    final int pageNumber = int.parse(GoRouter.of(context).location.split('/').last);
    final int pagesTotal = routes.length;
    void nextPage() {
      if (pageNumber != pagesTotal) GoRouter.of(context).push(('/${pageNumber + 1}').toString());
    }

    void prevPage() {
      if (pageNumber != 1) GoRouter.of(context).pop();
    }

    FocusScope.of(context).requestFocus(focusNode);
    return KeyboardListener(
        focusNode: focusNode,
        onKeyEvent: (value) {
          if (value is KeyUpEvent) {
            if (value.physicalKey == PhysicalKeyboardKey.arrowLeft) prevPage();
            if (value.physicalKey == PhysicalKeyboardKey.arrowRight) nextPage();
            if (value.physicalKey == PhysicalKeyboardKey.arrowUp) firstPage();
            if (value.physicalKey == PhysicalKeyboardKey.arrowDown) lastPage();
            if (value.physicalKey == PhysicalKeyboardKey.keyQ) {
              setState(() => currentColors = iterateColors(context, currentColors));
            }
          }
        },
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.2),
          // child: GestureDetector( TODO: work this out with demos
          //   onTap: nextPage,
          //   onSecondaryTap: prevPage,
          child: Stack(
            children: [
              Positioned(top: 0, bottom: 0, left: 0, right: 0, child: widget.child),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(Dimensions.m),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ZetaText.labelSmall(
                        pageNumber == 1 || pageNumber == pagesTotal ? '' : 'ZEBRA TECHNOLOGIES',
                        textColor: ZetaColors.of(context).textSubtle,
                      ),
                      ZetaText.labelSmall(
                        '$pageNumber/$pagesTotal',
                        //, ${colors[currentColors == 0 ? colors.length - 1 : currentColors - 1].name}',
                        textColor:
                            pageNumber == 1 ? ZetaColors.of(context).textSubtle : ZetaColors.of(context).textInverse,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // ),
        ));
  }
}

final routes = [
  const Page1(),
  const Page2(),
  const Page3(),
  const Page4(),
  const Page5(),
  const Page6(),
  const Page7(),
  const PageX(),
];

final GoRouter router = GoRouter(
  initialLocation: '/1',
  routes: routes
      .mapIndexed((index, page) => GoRoute(
            path: '/${index + 1}',
            pageBuilder: (context, state) => CustomTransitionPage<void>(
              child: NavWrapper(child: page),
              transitionDuration: const Duration(milliseconds: 200),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return SlideTransition(
                  position: animation.drive(
                    Tween<Offset>(
                      begin: const Offset(0, 0),
                      // begin: const Offset(0.5, 0),
                      end: Offset.zero,
                    ).chain(CurveTween(curve: Curves.easeIn)),
                  ),
                  child: child,
                );
              },
            ),
          ))
      .toList(),
);
