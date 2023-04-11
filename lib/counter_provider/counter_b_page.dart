import 'package:example/counter_provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterB extends StatefulWidget {
  const CounterB({super.key});

  @override
  State<CounterB> createState() => _CounterBState();
}

class _CounterBState extends State<CounterB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Increase counter value"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("You pushed the button this many times:"),
            Text('${context.watch<MyCounter>().getCounter()}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() => context.read<MyCounter>().incrementCounter());
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
