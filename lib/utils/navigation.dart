import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zds_flutter/zds_flutter.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

import '../main.dart';
import 'colors.dart';
import 'routes.dart';

const String scaleKey = 'scale';
const String fontKey = 'font';
const String colorKey = 'color';

class NavWrapper extends StatefulWidget {
  final Widget child;

  const NavWrapper({super.key, required this.child});

  @override
  State<NavWrapper> createState() => _NavWrapperState();
}

class _NavWrapperState extends State<NavWrapper> {
  Future<void> savePref(String key, String? name) async {
    if (name != null && name.isNotEmpty) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(key, name);
    }
  }

  final FocusNode _focusNode = FocusNode();
  bool showingDialog = false;
  final Map<String, String> fonts = {
    'Arial': 'arial',
    'Comic Sans': 'comic',
    'IBM Plex Sans': 'packages/zeta_flutter/IBMPlexSans',
    'IBM Plex Mono': 'IBMPlexMono',
  };

  Future<void> firstPage() async => GoRouter.of(context).pushReplacement('/1');
  Future<void> lastPage() async => GoRouter.of(context).pushReplacement('/${routes.length}');

  @override
  Widget build(BuildContext context) {
    final int pageNumber = int.parse(GoRouterState.of(context).uri.toString().split('/').last);
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

    return Scaffold(
      drawer: Drawer(
        backgroundColor: ZetaColors.of(context).cool.shade70,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...routes.entries.map(
                (item) => ListTile(
                  title: Text(item.key),
                  onTap: () {
                    // TODO(thelukewalton): find a way to inject all slides, rather than just jump to single slide.
                    unawaited(GoRouter.of(context).push('/${routes.keys.toList().indexOf(item.key) + 1}'));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: Builder(
        builder: (context) {
          return KeyboardListener(
            focusNode: _focusNode,
            onKeyEvent: (value) async {
              if (value is KeyUpEvent) {
                if (value.physicalKey == PhysicalKeyboardKey.arrowLeft) prevPage();
                if (value.physicalKey == PhysicalKeyboardKey.arrowRight) unawaited(nextPage());
                if (value.physicalKey == PhysicalKeyboardKey.f10) {
                  Scaffold.of(context).openDrawer();
                }
                if (value.physicalKey == PhysicalKeyboardKey.f9 && !showingDialog) {
                  showingDialog = true;
                  await showDialog<void>(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: Container(
                          width: 400,
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ZetaText.titleLarge('Developer options', textColor: ZetaColors.of(context).textSubtle),
                              IconTheme(
                                data: IconThemeData(color: ZetaColors.of(context).onSurface),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ZetaText.headingSmall('Scale'),
                                    const SizedBox(width: 40),
                                    IconButton(
                                      icon: const Icon(Icons.remove_circle_outline),
                                      onPressed: () =>
                                          setState(() => state.scaleMultiplier = state.scaleMultiplier - 0.1),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.add_circle_outline),
                                      onPressed: () =>
                                          setState(() => state.scaleMultiplier = state.scaleMultiplier + 0.1),
                                    ),
                                  ],
                                ),
                              ),
                              ZdsDropdownList(
                                value: ZetaColors.of(context),
                                label: 'Colors',
                                options:
                                    colorsObj.map((e) => ZdsDropdownListItem(value: e.colors, name: e.name)).toList(),
                                onChange: (val) {
                                  if (val != null && val is ZetaColors) {
                                    savePref(
                                      colorKey,
                                      colorsObj.firstWhereOrNull((element) => element.colors == val)?.name,
                                    ).then((value) async {
                                      ZetaColors.setColors(context, val);
                                      MyAppState().of(context)?.theme = ZetaThemeData(
                                        fontFamily: MyAppState().of(context)?.theme.fontFamily,
                                        zetaColors: ZetaColors.of(context),
                                      );
                                    });
                                  }
                                },
                              ),
                              ZdsDropdownList(
                                label: 'Font',
                                value: Theme.of(context).fontFamily,
                                options:
                                    fonts.entries.map((e) => ZdsDropdownListItem(value: e.value, name: e.key)).toList(),
                                onChange: (val) {
                                  if (val != null && val is String) {
                                    savePref(fontKey, val).then(
                                      (value) {
                                        MyAppState().of(context)?.theme = ZetaThemeData(
                                          fontFamily: val,
                                          zetaColors: ZetaColors.of(context),
                                        );
                                      },
                                    );
                                  }
                                },
                              ),
                            ].divide(const SizedBox(height: 20)).toList(),
                          ),
                        ),
                      );
                    },
                  );
                  final SharedPreferences prefs = await SharedPreferences.getInstance();
                  await prefs.setDouble(scaleKey, state.scaleMultiplier);
                  showingDialog = false;
                }
              }
            },
            child: DefaultTextStyle(
              style: ZetaText.zetaBodyMedium.copyWith(color: ZetaColors.of(context).textDefault),
              child: MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: state.scaleMultiplier),
                child: Stack(
                  children: [
                    Positioned(top: 0, bottom: 0, left: 0, right: 0, child: widget.child),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Material(
                        color: Colors.transparent,
                        child: IconButton(
                          icon: Icon(Icons.menu, color: Colors.white.withOpacity(0.05)),
                          onPressed: () => Scaffold.of(context).openDrawer(),
                          color: Colors.transparent,
                          hoverColor: Colors.black.withOpacity(0.05),
                        ),
                      ),
                    ),
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
              ),
            ),
          );
        },
      ),
    );
  }
}

final GoRouter router = GoRouter(
  initialLocation: '/1',
  routes: routes.entries
      .mapIndexed(
        (index, page) => GoRoute(
          path: '/${index + 1}',
          pageBuilder: (context, state) => CustomTransitionPage<void>(
            child: NavWrapper(child: page.value),
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
