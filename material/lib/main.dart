import 'package:flutter/material.dart';
import 'package:zeta_flutter/zeta_flutter.dart';

void main() {
  runApp(const ExampleMaterial());
}

class ExampleMaterial extends StatefulWidget {
  const ExampleMaterial({super.key});

  @override
  State<ExampleMaterial> createState() => _ExampleMaterialState();
}

class _ExampleMaterialState extends State<ExampleMaterial> {
  ThemeData theme = ThemeData.light();
  int index = 0;
  double v = 0.1;
  bool b = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: Container(
        color: Colors.white,
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
              appBar: AppBar(
                title: const Text('My material App'),
                actions: const [_Dropdown()],
              ),
              drawer: const _Drawer(),
              floatingActionButton: FloatingActionButton(
                child: const Icon(Icons.agriculture),
                onPressed: () => changeColor(context),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(onPressed: () {}, child: Text('TextButton')),
                      ElevatedButton(onPressed: () {}, child: Text('TextButton')),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(24),
                    child: TextField(
                        //TODO: check for anything useful in here
                        ),
                  ),
                  CircularProgressIndicator(),
                  Slider(value: v, onChanged: (n) => setState(() => v = n)),
                  Switch(value: b, onChanged: (n) => setState(() => b = n))
                ],
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
