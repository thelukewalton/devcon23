import 'package:flutter/material.dart';
import 'package:presentation/utils/navigation.dart';
import 'package:zds_flutter/zds_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ZdsApp(
      title: '',
      debugShowCheckedModeBanner: false,
      home: MaterialApp.router(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
