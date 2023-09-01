import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

void main() {
  runApp(const ExampleCupertino());
}

class ExampleCupertino extends StatefulWidget {
  final ZetaColors? colors;
  const ExampleCupertino({super.key, this.colors});

  @override
  State<ExampleCupertino> createState() => _ExampleCupertinoState();
}

class _ExampleCupertinoState extends State<ExampleCupertino> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: const MediaQueryData(),
      child: CupertinoApp(
        debugShowCheckedModeBanner: false,
        theme: const CupertinoThemeData(brightness: Brightness.light),
        home: Container(
          color: widget.colors?.surface,
          padding: const EdgeInsets.all(8),
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(39)),
              color: Colors.black,
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(39)),
              child: Container(
                color: const Color(0xFFF9F9F9),
                child: Column(
                  children: [
                    Container(
                      height: 48,
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              DateFormat('hh:mm').format(DateTime.now()),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              width: 100,
                              height: 30,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(39)),
                                color: Color(0xFF000000),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 24,
                                    width: 24,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFF06052F),
                                    ),
                                  ),
                                  const SizedBox(width: 4)
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: IconTheme(
                              data: const IconThemeData(color: Color(0xFF000000)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  const SizedBox(width: 4),
                                  const Icon(CupertinoIcons.wifi),
                                  const Icon(CupertinoIcons.battery_full),
                                ].divide(const SizedBox(width: 6)).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(child: CupertinoPage()),
                    Container(
                      height: 24,
                      color: const Color(0xFFF9F9F9),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CupertinoPage extends StatefulWidget {
  const CupertinoPage({super.key});

  @override
  State<CupertinoPage> createState() => _CupertinoPageState();
}

class _CupertinoPageState extends State<CupertinoPage> {
  double v = 0.1;
  bool b = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: 'Search',
          ),
        ],
      ),
      tabBuilder: (context, index) => CustomScrollView(
        slivers: [
          const CupertinoSliverNavigationBar(
            leading: Icon(CupertinoIcons.person_2),
            largeTitle: Text('Cupertino Nav Bar'),
            trailing: Icon(CupertinoIcons.add_circled),
          ),
          SliverFillRemaining(
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(height: 24),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CupertinoButton(child: const Text('CupertinoButton'), onPressed: () {}),
                          CupertinoButton.filled(
                              child: const Text('.filled'),
                              onPressed: () {
                                showCupertinoDialog(
                                  context: context,
                                  builder: (c2) => CupertinoAlertDialog(
                                    title: const Text('Alert!'),
                                    actions: [
                                      CupertinoDialogAction(
                                        isDestructiveAction: true,
                                        onPressed: () => Navigator.of(c2).pop(),
                                        child: const Text('Action'),
                                      )
                                    ],
                                  ),
                                );
                              }),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(12),
                      child: CupertinoTextField(
                        prefix: Icon(CupertinoIcons.person_solid),
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        placeholder: 'Cupertino Text Field',
                      ),
                    ),
                    CupertinoListSection.insetGrouped(
                      header: const Text('CupertinoListSection'),
                      children: <CupertinoListTile>[
                        CupertinoListTile.notched(
                          title: const Text('CupertinoListTile'),
                          leading: Container(color: CupertinoColors.activeGreen),
                          trailing: const CupertinoListTileChevron(),
                          onTap: () {},
                        ),
                        CupertinoListTile.notched(
                          title: const Text('View last commit'),
                          leading: Container(color: CupertinoColors.activeOrange),
                          additionalInfo: const Text('12 days ago'),
                          onTap: () {},
                        ),
                      ],
                    ),
                    const CupertinoActivityIndicator(),
                    CupertinoSlider(value: v, onChanged: (n) => setState(() => v = n)),
                    CupertinoSwitch(value: b, onChanged: (n) => setState(() => b = n)),
                    const SizedBox(height: 80),
                  ].divide(const SizedBox(height: 24)).toList()),
            ),
          ),
        ],
      ),
    );
  }
}
