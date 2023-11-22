import 'package:flutter/material.dart';
import 'package:flutter_demo_riverpod/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_demo_riverpod/screens/main_screen.dart';
class DetailScreen extends ConsumerStatefulWidget {
  final VoidCallback onClearData;

  const DetailScreen({Key? key, required this.onClearData}) : super(key: key);

  static String routeName = '/detail_screen';

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends ConsumerState<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final counterProv = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Detail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button in the previous screen this many times:',
            ),
            Text(
              counterProv.getCounter().toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Reset the counter in the main screen
                widget.onClearData();
                // Reset the counter in this screen
                setState(() {
                  counterProv.resetCounter();
                });
              },
              child: const Text('Clear Data'),
            ),
          ],
        ),
      ),
    );
  }
}
