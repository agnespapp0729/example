import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
        title: Text("Dec"),
      ),
      body: Column(
        children: [
          Text("Count:"),
          ElevatedButton(onPressed: () {}, child: Text("Decrease with 1")),
        ],
      ),
    );
  }
}
