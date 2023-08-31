import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zds_flutter/zds_flutter.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

import 'utils/navigation.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final bool isDevCon = true;
  GlobalKey key = GlobalKey();
  ZetaThemeData _theme = const ZetaThemeData();
  ZetaThemeData get theme => _theme;
  set theme(ZetaThemeData value) {
    setState(() {
      _theme = value;
      key = GlobalKey();
    });
  }

  String selectedFont = 'Arial';
  late double scaleMultiplier;
  bool ready = false;

  MyAppState? of(BuildContext context) => context.findAncestorStateOfType<MyAppState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      scaleMultiplier = prefs.getDouble(scaleKey) ?? 1;
      setState(() => ready = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!ready) return const Center(child: CircularProgressIndicator.adaptive());

    return ZdsApp(
      title: '',
      debugShowCheckedModeBanner: false,
      zetaTheme: theme,
      home: const Home(),
      key: key,
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: Theme.of(context),
    );
  }
}
