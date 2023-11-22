import 'package:flutter/material.dart';
import 'package:flutter_demo_riverpod/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailScreen extends ConsumerStatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

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
            Consumer(
              builder: (context, watch, child) {
                final counterProv = watch(counterProvider);

                return Text(
                  counterProv.getCounter().toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Clear data in the main screen
                context.read(counterProvider).resetCounter();

                // Retrieve the main screen's provider and reset the counter
                context.read(counterProvider).resetCounter();

                // Navigate back to the main screen
                Navigator.pop(context);
              },
              child: const Text('Clear Data'),
            ),
          ],
        ),
      ),
    );
  }
}
