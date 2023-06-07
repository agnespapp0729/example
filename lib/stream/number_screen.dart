import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class NumberScreen extends StatefulWidget {
  const NumberScreen({super.key});

  @override
  State<NumberScreen> createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
  final Stream _myStream =
      Stream.periodic(const Duration(seconds: 1), (int count) {
    return count;
  });

//subscription on events
  late StreamSubscription _sub;

//this number will be displayed
  int _computationCount = 0;

  Color _bgColor = Colors.indigo;

  @override
  void initState() {
    _sub = _myStream.listen((event) {
      setState(() {
        _computationCount = event;
        _bgColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      appBar: AppBar(),
      body: Center(
        child: Text(
          _computationCount.toString(),
          style: const TextStyle(fontSize: 150, color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.stop, size: 30),
        onPressed: () => _sub.cancel(),
      ),
    );
  }
}
