import 'package:example/text_provider/text_output.dart';
import 'package:example/text_provider/text_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextInput extends StatefulWidget {
  const TextInput({super.key});

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextProvider textProvider = Provider.of<TextProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Get a name"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Please enter your name',
              ),
              TextField(
                controller: _textEditingController,
                onSubmitted: (value) {
                  setState(() {
                    textProvider.saveName(_textEditingController.text);
                  });
                },
                onChanged: (value) {
                  setState(() {
                    textProvider.saveName(_textEditingController.text);
                  });
                },
              ),
              TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider.value(
                      value: textProvider,
                      builder: (context, child) => const TextOutput(),
                    ),
                  ),
                ),
                child: const Text("See the output"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
