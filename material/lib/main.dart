import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

void main() {
  runApp(const ExampleMaterial());
}

class ExampleMaterial extends StatefulWidget {
  final ZetaColors? colors;

  const ExampleMaterial({super.key, this.colors});

  @override
  State<ExampleMaterial> createState() => _ExampleMaterialState();
}

class _ExampleMaterialState extends State<ExampleMaterial> {
  ThemeData? theme;
  int index = 0;
  double v = 0.1;
  bool b = false;

  @override
  Widget build(BuildContext context) {
    if (theme == null) changeColor(context);
    return MediaQuery(
      data: const MediaQueryData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        home: DefaultTabController(
          length: 2,
          child: Container(
            color: widget.colors?.surface,
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Colors.black,
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: Scaffold(
                  drawer: const _Drawer(),
                  floatingActionButton: FloatingActionButton(
                    child: const Icon(Icons.agriculture),
                    onPressed: () => changeColor(context),
                  ),
                  bottomNavigationBar: BottomNavigationBar(
                    items: const [
                      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                      BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
                    ],
                  ),
                  body: Column(
                    children: [
                      IconTheme(
                        data: IconThemeData(color: theme?.colorScheme.onBackground, size: 18),
                        child: Container(
                          color: theme?.colorScheme.primary.withOpacity(0.08),
                          height: 28,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  DateFormat('h:mm').format(DateTime.now()),
                                  style: TextStyle(color: theme?.colorScheme.onBackground, fontWeight: FontWeight.w500),
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.wifi),
                                    const Icon(Icons.network_cell),
                                    const Icon(Icons.battery_full_outlined),
                                  ].divide(const SizedBox(width: 8)).toList(),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: CustomScrollView(
                          slivers: [
                            // ignore: prefer_const_constructors
                            SliverAppBar.large(
                              title: const Text('Large App Bar'),
                              actions: const [_Dropdown()],
                            ),
                            SliverFillRemaining(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ElevatedButton(onPressed: () {}, child: const Text('ElevatedButton')),
                                        FilledButton(onPressed: () {}, child: const Text('FilledButton')),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        OutlinedButton(onPressed: () {}, child: const Text('OutlinedButton')),
                                        TextButton(onPressed: () {}, child: const Text('TextButton')),
                                      ],
                                    ),
                                    FilledButton.tonal(onPressed: () {}, child: const Text('FilledButton.tonal')),
                                    Padding(
                                      padding: const EdgeInsets.all(24),
                                      child: TextField(
                                        buildCounter: (context,
                                            {required currentLength, required isFocused, maxLength}) {
                                          return Text('$currentLength characters');
                                        },
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          prefixIcon: Icon(Icons.person),
                                          label: Text('TextField'),
                                        ),
                                      ),
                                    ),
                                    Card(
                                      child: ListView(
                                        shrinkWrap: true,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                                            child: Text(
                                              'Card',
                                              style: theme?.textTheme.displayLarge?.copyWith(fontSize: 28),
                                            ),
                                          ),
                                          ListTile(
                                            title: const Text('ListTile'),
                                            subtitle: const Text('Supporting text'),
                                            leading: const CircleAvatar(child: Text('A')),
                                            onTap: () {},
                                          ),
                                        ],
                                      ),
                                    ),
                                    const CircularProgressIndicator(),
                                    Slider(value: v, onChanged: (n) => setState(() => v = n)),
                                    Switch(value: b, onChanged: (n) => setState(() => b = n)),
                                    const SizedBox(height: 80),
                                  ].divide(const SizedBox(height: 24)).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void changeColor(BuildContext context) {
    return setState(
      () {
        if (index == ZetaColors.of(context).rainbow.length - 1) {
          index = 0;
        } else {
          index += 1;
        }
        theme = ThemeData.light().copyWith(
          colorScheme: ColorScheme.fromSeed(
            seedColor: ZetaColors.of(context).rainbow[index],
          ),
          useMaterial3: true,
        );
      },
    );
  }
}

class _Drawer extends StatelessWidget {
  const _Drawer();

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).colorScheme.onSecondary,
        width: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 100, bottom: 20, left: 50),
              width: 200,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Text(
                'Example App',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primary,
                padding: const EdgeInsets.only(left: 12),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSecondary,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      bottomLeft: Radius.circular(40),
                    ),
                  ),
                  child: Material(
                    type: MaterialType.transparency,
                    child: Column(children: [
                      ListTile(title: const Text('Settings'), onTap: () {}),
                      ListTile(title: const Text('About'), onTap: () {}),
                      ListTile(title: const Text('Etc.'), onTap: () {}),
                    ]),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.only(topRight: Radius.circular(40)),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Expanded(child: FlutterLogo(size: 40))],
              ).squish(20),
            ),
          ],
        ));
  }
}

class _Dropdown extends StatelessWidget {
  const _Dropdown();

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.more_vert),
      position: PopupMenuPosition.under,
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        const PopupMenuItem(
          value: '1',
          child: Text('Item 1'),
        ),
        const PopupMenuItem(
          value: '2',
          child: Text('Item 2'),
        ),
        const PopupMenuItem(
          value: '3',
          child: Text('Item 3'),
        ),
      ],
    );
  }
}
