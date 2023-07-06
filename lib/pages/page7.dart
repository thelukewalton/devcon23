import 'package:flutter/material.dart';
import 'package:flutter_highlight/themes/a11y-dark.dart';
import 'package:flutter_highlight/themes/a11y-light.dart';
import 'package:zeta_flutter/zeta_flutter.dart';
import 'package:markdown_widget/markdown_widget.dart';
import '../components/content.dart';
import '../components/example.dart';

class Page7 extends StatelessWidget {
  const Page7({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Row(
        children: [
          Expanded(
            child: Content(
              title: 'What does Flutter look like?',
              content: Center(
                child: SizedBox(
                  width: constraints.maxWidth * 0.22,
                  height: constraints.maxWidth * 0.4,
                  child: const Example(),
                ),
              ),
            ),
          ),
          Expanded(
            child: DefaultTextStyle(
              style: ZetaText.zetaBodyMedium.copyWith(fontFamily: 'IbmPlexMono'),
              child: MarkdownWidget(
                  shrinkWrap: true,
                  config: MarkdownConfig.darkConfig,
                  data:
                      '\x60\x60\x60\x64\x61\x72\x74\x0a\x63\x6c\x61\x73\x73\x20\x5f\x45\x78\x61\x6d\x70\x6c\x65\x53\x74\x61\x74\x65\x20\x65\x78\x74\x65\x6e\x64\x73\x20\x53\x74\x61\x74\x65\x3c\x45\x78\x61\x6d\x70\x6c\x65\x3e\x20\x7b\x0a\x0a\x20\x20\x40\x6f\x76\x65\x72\x72\x69\x64\x65\x0a\x20\x20\x57\x69\x64\x67\x65\x74\x20\x62\x75\x69\x6c\x64\x28\x42\x75\x69\x6c\x64\x43\x6f\x6e\x74\x65\x78\x74\x20\x63\x6f\x6e\x74\x65\x78\x74\x29\x20\x7b\x0a\x20\x20\x20\x20\x72\x65\x74\x75\x72\x6e\x20\x4d\x61\x74\x65\x72\x69\x61\x6c\x41\x70\x70\x28\x0a\x20\x20\x20\x20\x20\x20\x64\x65\x62\x75\x67\x53\x68\x6f\x77\x43\x68\x65\x63\x6b\x65\x64\x4d\x6f\x64\x65\x42\x61\x6e\x6e\x65\x72\x3a\x20\x66\x61\x6c\x73\x65\x2c\x0a\x20\x20\x20\x20\x20\x20\x74\x68\x65\x6d\x65\x3a\x20\x74\x68\x65\x6d\x65\x2c\x0a\x20\x20\x20\x20\x20\x20\x68\x6f\x6d\x65\x3a\x20\x53\x63\x61\x66\x66\x6f\x6c\x64\x28\x0a\x20\x20\x20\x20\x20\x20\x20\x20\x61\x70\x70\x42\x61\x72\x3a\x20\x41\x70\x70\x42\x61\x72\x28\x0a\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x74\x69\x74\x6c\x65\x3a\x20\x63\x6f\x6e\x73\x74\x20\x54\x65\x78\x74\x28\x27\x4d\x79\x20\x41\x70\x70\x27\x29\x2c\x0a\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x61\x63\x74\x69\x6f\x6e\x73\x3a\x20\x63\x6f\x6e\x73\x74\x20\x5b\x5f\x44\x72\x6f\x70\x64\x6f\x77\x6e\x28\x29\x5d\x2c\x0a\x20\x20\x20\x20\x20\x20\x20\x20\x29\x2c\x0a\x20\x20\x20\x20\x20\x20\x20\x20\x64\x72\x61\x77\x65\x72\x3a\x20\x63\x6f\x6e\x73\x74\x20\x5f\x44\x72\x61\x77\x65\x72\x28\x29\x2c\x0a\x20\x20\x20\x20\x20\x20\x20\x20\x66\x6c\x6f\x61\x74\x69\x6e\x67\x41\x63\x74\x69\x6f\x6e\x42\x75\x74\x74\x6f\x6e\x3a\x20\x46\x6c\x6f\x61\x74\x69\x6e\x67\x41\x63\x74\x69\x6f\x6e\x42\x75\x74\x74\x6f\x6e\x28\x0a\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x63\x68\x69\x6c\x64\x3a\x20\x63\x6f\x6e\x73\x74\x20\x49\x63\x6f\x6e\x28\x49\x63\x6f\x6e\x73\x2e\x61\x67\x72\x69\x63\x75\x6c\x74\x75\x72\x65\x29\x2c\x0a\x20\x20\x20\x20\x20\x20\x20\x20\x20\x20\x6f\x6e\x50\x72\x65\x73\x73\x65\x64\x3a\x20\x28\x29\x20\x3d\x3e\x20\x63\x68\x61\x6e\x67\x65\x43\x6f\x6c\x6f\x72\x28\x63\x6f\x6e\x74\x65\x78\x74\x29\x2c\x0a\x20\x20\x20\x20\x20\x20\x20\x20\x29\x2c\x0a\x20\x20\x20\x20\x20\x20\x20\x20\x62\x6f\x64\x79\x3a\x20\x63\x6f\x6e\x73\x74\x20\x43\x65\x6e\x74\x65\x72\x28\x63\x68\x69\x6c\x64\x3a\x20\x54\x65\x78\x74\x28\x27\x57\x65\x6c\x63\x6f\x6d\x65\x27\x29\x29\x2c\x0a\x20\x20\x20\x20\x20\x20\x29\x2c\x0a\x20\x20\x20\x20\x29\x3b\x0a\x20\x20\x7d\x0a\x7d\x0a\x60\x60\x60'),
            ),
          ),
        ],
      );
    });
  }
}
