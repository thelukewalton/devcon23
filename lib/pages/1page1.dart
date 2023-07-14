// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:presentation/components/title.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsFlutterBinding.ensureInitialized();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.wait([
        vg.loadPicture(const SvgAssetLoader('lib/assets/code.svg'), context),
        precacheImage(Image.asset('lib/assets/divider.png').image, context),
        precacheImage(Image.asset('lib/assets/end.png').image, context),
        vg.loadPicture(const SvgAssetLoader('lib/assets/ESS.svg'), context),
        precacheImage(Image.asset('lib/assets/intro.png').image, context),
        vg.loadPicture(const SvgAssetLoader('lib/assets/logoBlack.svg'), context),
        vg.loadPicture(const SvgAssetLoader('lib/assets/logoWhite.svg'), context),
        vg.loadPicture(const SvgAssetLoader('lib/assets/QChat.svg'), context),
        vg.loadPicture(const SvgAssetLoader('lib/assets/zebra-logo-stacked.svg'), context),
        vg.loadPicture(const SvgAssetLoader('lib/assets/zebra-logo.svg'), context),
        precacheImage(Image.asset('lib/assets/zsb2.png').image, context),
        precacheImage(Image.asset('lib/assets/zsbapp.png').image, context),
        vg.loadPicture(const SvgAssetLoader('lib/assets/builtin.svg'), context),
        vg.loadPicture(const SvgAssetLoader('lib/assets/ExcludeSemantics.svg'), context),
        vg.loadPicture(const SvgAssetLoader('lib/assets/MergeSemantics.svg'), context),
        vg.loadPicture(const SvgAssetLoader('lib/assets/semantics.svg'), context),
      ]);
      setState(() => isLoading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator.adaptive());
    }
    return const TitlePage(
      title: 'Common UX across Android, iOS and Web with Flutter',
      name: 'Luke Walton',
      job: 'Front end Developer',
    );
  }
}
