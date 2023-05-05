import 'package:example/providers/text_provider/text_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextOutput extends StatelessWidget {
  const TextOutput({super.key});

  @override
  Widget build(BuildContext context) {
    final TextProvider textProvider = Provider.of<TextProvider>(context);

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
