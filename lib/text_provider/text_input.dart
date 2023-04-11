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
  String name = "";
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                    name = value;
                  });
                },
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
              ),
              TextButton(
                onPressed: () {
                  Provider.of<TextProvider>(context, listen: false)
                      .saveName(_textEditingController.text);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TextOutput(),
                    ),
                  );
                },
                child: const Text("See the output"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
