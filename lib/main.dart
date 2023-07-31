import 'package:flutter/material.dart';
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

  static MyAppState? of(BuildContext context) => context.findAncestorStateOfType<MyAppState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();

    return ZdsApp(
      title: '',
      debugShowCheckedModeBanner: false,
      zetaTheme: const ZetaThemeData(fontFamily: 'Arial'),
      home: Builder(builder: (context) {
        return MaterialApp.router(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          theme: Theme.of(context),
        );
      }),
    );
  }
}
