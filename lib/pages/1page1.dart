import 'package:flutter/material.dart';

import '../components/title.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return const TitlePage(
      title: 'Common UX across Android, iOS and Web with Flutter',
      name: 'Luke Walton',
      job: 'Front end Developer',
    );
  }
}
