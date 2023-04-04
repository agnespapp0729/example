import 'package:example/counter_provider/change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class CounterB extends StatefulWidget {
  const CounterB({super.key});

  @override
  State<CounterB> createState() => _CounterBState();
}

class _CounterBState extends State<CounterB> {
  @override
  Widget build(BuildContext context) {
    final counterModel = Provider.of<MyCounter>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Increase counter value"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You pushed the button this many times"),
            Text('${counterModel.getCounter()}')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counterModel.incrementCounter(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
