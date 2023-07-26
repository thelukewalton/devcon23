// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:cupertino/main.dart';
import 'package:material/main.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

import '../components/content.dart';

class WhatDoesFlutterLookLikeCupertino extends StatefulWidget {
  const WhatDoesFlutterLookLikeCupertino({super.key});

  @override
  State<WhatDoesFlutterLookLikeCupertino> createState() => _WhatDoesFlutterLookLikeCupertinoState();
}

class _WhatDoesFlutterLookLikeCupertinoState extends State<WhatDoesFlutterLookLikeCupertino> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Content(
            backgroundOnTop: false,
            title: 'What does Flutter look like?',
            content: const Row(
              children: [
                Expanded(child: Text('')),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(child: ExampleMaterial()),
                      Expanded(child: ExampleCupertino()),
                    ],
                  ),
                ),
              ],
            ).squish(Dimensions.m).inlineEnd(Dimensions.l),
          ),
        ),
      ],
    );
  }
}
