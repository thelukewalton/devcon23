// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:cupertino/main.dart';
import 'package:material/main.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

import '../components/content.dart';

class WhatDoesFlutterLookLikeCupertino extends StatelessWidget {
  const WhatDoesFlutterLookLikeCupertino({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Content(
            backgroundOnTop: false,
            title: 'What does Flutter look like?',
            content: Row(
              children: [
                const Expanded(child: Text('')),
                Expanded(
                    child: MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: MediaQuery.of(context).textScaleFactor - 0.2),
                  child: const Row(
                    children: [
                      Expanded(child: ExampleMaterial()),
                      Expanded(child: ExampleCupertino()),
                    ],
                  ),
                )),
              ],
            ).squish(Dimensions.m).inlineEnd(Dimensions.l),
          ),
        ),
      ],
    );
  }
}
