import 'package:flutter/material.dart';
import 'package:presentation/utils/navigation.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Zeta(builder: (context, theme, colors) {
      return MaterialApp.router(
        title: 'Flutter Demo',
        theme: theme,
        routerConfig: router,
      );
    });
  }
}
