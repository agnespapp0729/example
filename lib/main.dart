import 'package:example/login/login_state.dart';
import 'package:example/text_provider/text_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_provider/counter_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Project',
      home: LoginState(),
    );
  }
}
