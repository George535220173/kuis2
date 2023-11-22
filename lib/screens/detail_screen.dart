import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:p14/provider.dart';
import 'package:p14/screens/main_screen.dart';

class DetailScreen extends ConsumerStatefulWidget {
  const DetailScreen({super.key});

  static String routeName = '/detail_screen';

  @override
  ConsumerState<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends ConsumerState<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final counterProv = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap:() { Navigator.pushNamed(context, MyHomePage.routeName);
          setState(() {
            
          });},
          child: Icon(
            Icons.arrow_back
        
            
          ),
        ),
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