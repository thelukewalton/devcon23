import 'package:flutter/widgets.dart';

import '../pages/10WhatDoesFlutterLookLike.dart';
import '../pages/11MatCupExample.dart';
import '../pages/12AccessibilityDivider.dart';
import '../pages/13_0Accessability.dart';
import '../pages/13_1Accessability.dart';
import '../pages/13_2Accessability.dart';
import '../pages/13_3Accessability.dart';
import '../pages/13_4Accessability.dart';
import '../pages/13_5Accessability.dart';
import '../pages/13_6Accessability.dart';
import '../pages/13_7Accessability.dart';
import '../pages/14AAA.dart';
import '../pages/15Semantics.dart';
import '../pages/16NextSteps.dart';
import '../pages/17Conclusion.dart';
import '../pages/18ZDS.dart';
import '../pages/19Zeta.dart';
import '../pages/1Intro.dart';
import '../pages/20End.dart';
import '../pages/2ID.dart';
import '../pages/3StateofCrossPlatform.dart';
import '../pages/4CrossPlatformHistory.dart';
import '../pages/5ReactNativeFlutter.dart';
import '../pages/6_0ZSBProblem.dart';
import '../pages/6_5ZSBProblem2.dart';
import '../pages/7_0ZSBSolution.dart';
import '../pages/7_5ZSBSolution2.dart';
import '../pages/8_0WorkCloud.dart';
import '../pages/8_5WorkCloud2.dart';
import '../pages/9FlutterDivider.dart';

final Map<String, Widget> routes = {
  'Intro': const IntroPage(),
  'Innovation Design': const InnovationDesign(),
  'State of cross-platform': const StateOfCrossPlatform(),
  'Cross-platform history': const CrossPlatformHistory(),
  'React Native or Flutter': const ReactNativeOrFlutter(),
  'ZSB Series Printer': const ZSBProblem(),
  'ZSB Series Printer 2': const ZSBProblem2(),
  'ZSB Series Printer & Flutter': const ZSBSolution(),
  'ZSB Series Printer & Flutter 2': const ZSBSolution2(),
  'Zebra WorkCloud': const WorkCloud(),
  'Zebra WorkCloud 2': const WorkCloud2(),
  'Flutter 101': const Flutter101(),
  'Basic Flutter example': const WhatDoesFlutterLookLike(),
  'Widgets example': const MaterialCupertinoExample(),
  'Accessibility divider': const AccessibilityDivider(),
  'Accessibility ': const Accessibility(),
  'Accessibility 2': const Accessibility1(),
  'Accessibility 3': const Accessibility2(),
  'Accessibility 4': const Accessibility3(),
  'Accessibility 5': const Accessibility4(),
  'Accessibility 6': const Accessibility5(),
  'Accessibility 7': const Accessibility6(),
  'Accessibility 8': const Accessibility7(),
  'AAA': const AAA(),
  'Semantics': const SemanticsPage(),
  'Conclusion Divider': const NextSteps(),
  'FuturePage': const FuturePage(),
  'ZDS': const ZDS(),
  'ZetaPage': const ZetaPage(),
  'End': const End(),
};

Map<String, Widget> get routesSanitized {
  return {...routes}..removeWhere((key, value) => key.contains(RegExp('[0-9]')) && !key.contains('101'));
}
