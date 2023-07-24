import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ExampleCupertino());
}

class ExampleCupertino extends StatefulWidget {
  const ExampleCupertino({super.key});

  @override
  State<ExampleCupertino> createState() => _ExampleCupertinoState();
}

class _ExampleCupertinoState extends State<ExampleCupertino> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(39)),
          color: Colors.black,
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(39)),
          child: CupertinoApp(
            debugShowCheckedModeBanner: false,
            theme: const CupertinoThemeData(brightness: Brightness.light),
            home: Container(
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
                            width: 120,
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
                        const Expanded(
                          child: IconTheme(
                            data: IconThemeData(color: Color(0xFF000000)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(CupertinoIcons.wifi),
                                SizedBox(width: 16),
                                Icon(CupertinoIcons.battery_full),
                              ],
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
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CupertinoButton(child: const Text('Button'), onPressed: () {}),
                  CupertinoButton.filled(
                      child: const Text('Button'),
                      onPressed: () {
                        showCupertinoDialog(
                            context: context,
                            builder: (_) => CupertinoAlertDialog(
                                  title: const Text('Alert!'),
                                  actions: [
                                    CupertinoDialogAction(
                                      isDestructiveAction: true,
                                      onPressed: () => Navigator.of(context).pop(),
                                      child: const Text('Action'),
                                    )
                                  ],
                                ));
                      }),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(12),
                child: CupertinoTextField(
                  prefix: Icon(CupertinoIcons.person_solid),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  placeholder: 'Cupertino Text Field',
                ),
              ),
              const CupertinoActivityIndicator(),
              CupertinoSlider(value: v, onChanged: (n) => setState(() => v = n)),
              CupertinoSwitch(value: b, onChanged: (n) => setState(() => b = n)),
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
              CupertinoContextMenu(
                actions: <Widget>[
                  CupertinoContextMenuAction(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    isDefaultAction: true,
                    trailingIcon: CupertinoIcons.doc_on_clipboard_fill,
                    child: const Text('Copy'),
                  ),
                  CupertinoContextMenuAction(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    trailingIcon: CupertinoIcons.share,
                    child: const Text('Share'),
                  ),
                  CupertinoContextMenuAction(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    trailingIcon: CupertinoIcons.heart,
                    child: const Text('Favorite'),
                  ),
                  CupertinoContextMenuAction(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    isDestructiveAction: true,
                    trailingIcon: CupertinoIcons.delete,
                    child: const Text('Delete'),
                  ),
                ],
                child: const FlutterLogo(size: 50.0),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
