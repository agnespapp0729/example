import 'package:example/counter_provider/counter_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterA extends StatefulWidget {
  const CounterA({super.key});

  @override
  State<CounterA> createState() => _CounterAState();
}

class _CounterAState extends State<CounterA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Decrease counter value"),
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
          setState(() {
            context.read<MyCounter>().decrementCounter();
          });
        },
        tooltip: 'Decrement',
        child: const Icon(Icons.remove),
      ),
    );
  }
}
