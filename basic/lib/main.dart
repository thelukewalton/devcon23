import 'package:flutter/widgets.dart';

void main() => runApp(const Example());

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      color: const Color(0xFF007ABA),
      builder: (BuildContext context, Widget? child) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text('Hello Flutter!'),
          Image.asset('lib/dash.png', height: 200),
        ],
      ),
    );
  }
}
