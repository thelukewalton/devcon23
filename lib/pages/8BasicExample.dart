// ignore_for_file: file_names
import 'package:flutter/material.dart';
import '../components/content.dart';
import 'package:basic/main.dart';

class WhatDoesFlutterLookLikeMaterial extends StatelessWidget {
  const WhatDoesFlutterLookLikeMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Row(
        children: [
          Expanded(
            child: Content(
              backgroundOnTop: false,
              title: 'What does Flutter look like?',
              content: Row(
                children: [
                  const Expanded(
                    child: Text(''),
                  ),
                  Expanded(
                    child: Center(
                      child: SizedBox(
                        height: constraints.maxHeight * 0.75,
                        width: constraints.maxHeight * 0.75 / 1.8,
                        child: const Example(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
