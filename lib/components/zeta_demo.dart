import 'package:flutter/material.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

class ZetaDemo extends StatelessWidget {
  const ZetaDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final ZetaColors colors = ZetaColors.of(context);
    final Map<String, ZetaColorSwatch> swatches = {
      'Blue': colors.blue,
      'Green': colors.green,
      'Red': colors.red,
      'Orange': colors.orange,
      'Purple': colors.purple,
      'Yellow': colors.yellow,
      'Teal': colors.teal,
      'Pink': colors.pink,
      'Grey Warm': colors.warm,
      'Grey Cool': colors.cool,
    };

    return Zeta(
      builder: (BuildContext context, ThemeData data, ZetaColors colors) {
        return ColoredBox(
          color: ZetaColors.of(context).white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ZetaText.headingLarge('Zeta Heading Large'),
              ZetaText.headingMedium('Zeta Heading Medium'),
              ZetaText.headingSmall('Zeta Heading Small'),
              ZetaText.titleLarge('Zeta Title Large'),
              ZetaText.titleMedium('Zeta Title Medium'),
              ZetaText.titleSmall('Zeta Title Small'),
              ZetaText.bodyLarge('Zeta Body Large'),
              ZetaText.bodyMedium('Zeta Body Medium'),
              ZetaText.bodySmall('Zeta Body Small'),
              MyRow(children: swatches, title: 'Primary colors'),
            ],
          ),
        );
      },
    );
  }
}

class MyRow extends StatelessWidget {
  final Map<String, ZetaColorSwatch> children;
  final String title;
  const MyRow({super.key, required this.children, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: children.entries
          .map(
            (MapEntry<String, ZetaColorSwatch> item) => Row(
              children: List.generate(10, (index) => 100 - (10 * index))
                  .map(
                    (e) => Expanded(
                      child: Container(
                        height: 40,
                        width: 40,
                        // height: constraints.maxWidth / 10,
                        color: item.value[e],
                        // child: FittedBox(
                        //   fit: BoxFit.scaleDown,
                        //   child: Column(
                        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //     children: [
                        //       DefaultTextStyle(
                        //         style: ZetaText.zetaBodyMedium
                        //             .copyWith(color: calculateTextColor(item.value[e] ?? Colors.white)),
                        //         child: Column(
                        //           children: [
                        //             Text('${item.key.toLowerCase().replaceAll(' ', '')}-$e'),
                        //             // Text(value.value[e].toString().replaceAll('Color(0xff', '#').substring(0, 7)),
                        //           ],
                        //         ),
                        //       ),
                        //     ],
                        // ),
                        // ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          )
          .toList(),
    );
    // return Column(
    //   children: children.entries
    //       .map(
    //         (key, value) => Row(
    //           children: [
    //             Expanded(
    //               child: SingleChildScrollView(
    //                 scrollDirection: Axis.horizontal,
    //                 child: Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     ZetaText.labelLarge(title, textColor: ZetaColors.of(context).textDefault),
    //                     Row(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       mainAxisSize: MainAxisSize.min,
    //                       children: children.entries
    //                           .map(
    //                             (e) => Container(
    //                               height: 160,
    //                               width: 160,
    //                               color: e.value,
    //                               child: FittedBox(
    //                                 fit: BoxFit.scaleDown,
    //                                 child: Column(
    //                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                                   children: [
    //                                     DefaultTextStyle(
    //                                       style: ZetaText.zetaBodyMedium.copyWith(color: calculateTextColor(e.value)),
    //                                       child: Column(
    //                                         children: [
    //                                           Text(e.key),
    //                                           Text(e.value.toString().replaceAll('Color(0xff', '#').substring(0, 7)),
    //                                         ],
    //                                       ),
    //                                     ),
    //                                   ],
    //                                 ),
    //                               ),
    //                             ),
    //                           )
    //                           .toList(),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       )
    //       .toList(),
    // );
  }
}

extension StringExtension on Color {
  String get toHexString {
    return toString().substring(10, 16).toUpperCase();
  }
}

Color calculateTextColor(Color background) {
  return ThemeData.estimateBrightnessForColor(background) == Brightness.light ? Colors.black : Colors.white;
}
