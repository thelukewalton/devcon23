import 'package:flutter/widgets.dart';

void main() => runApp(const Example());

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text('Hello Flutter!'),
        Image.asset('packages/basic/lib/dash.png', height: 200),
      ],
    );
  }
}
