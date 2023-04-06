import 'package:flutter/material.dart';

class TextOutput extends StatefulWidget {
  const TextOutput({super.key});

  @override
  State<TextOutput> createState() => _TextInputState();
}

class _TextInputState extends State<TextOutput> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Type a word!'),
      ),
      body: Center(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
