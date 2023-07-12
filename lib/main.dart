import 'package:flutter/material.dart';
import 'package:presentation/utils/navigation.dart';
import 'package:zds_flutter/zds_flutter.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

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
    return ZdsApp(
      title: '',
      debugShowCheckedModeBanner: false,
      home: Zeta(builder: (context, theme, colors) {
        return MaterialApp.router(
          title: 'Flutter Demo',
          theme: theme,
          debugShowCheckedModeBanner: false,
          routerConfig: router,
        );
      }),
    );
  }
}
