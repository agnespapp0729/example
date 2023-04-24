import 'package:example/text_provider/text_provider.dart';
import 'package:example/text_provider/text_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'text_provider.dart';

class TextOutput extends StatefulWidget {
  const TextOutput({super.key});

  @override
  State<TextOutput> createState() => _TextOutputState();
}

class _TextOutputState extends State<TextOutput> {
  @override
  Widget build(BuildContext context) {
    final textProvider = Provider.of<TextProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Show output"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hello ${textProvider.name}!",
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
