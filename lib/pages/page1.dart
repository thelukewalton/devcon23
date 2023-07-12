import 'package:flutter/material.dart';
import 'package:presentation/components/title.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  void didChangeDependencies() {
    precacheImage(Image.asset('lib/assets/zsb.jpg').image, context);
    precacheImage(Image.asset('lib/assets/zsbapp.jpg').image, context);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return const TitlePage(
      title: 'Common UX across Android, iOS and Web with Flutter',
      name: 'Luke Walton',
      job: 'Front end Developer',
    );
  }
}
