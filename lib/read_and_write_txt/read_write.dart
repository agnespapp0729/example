import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ReadAndWrite extends StatefulWidget {
  const ReadAndWrite({super.key});

  @override
  State<ReadAndWrite> createState() => _ReadAndWriteState();
}

class _ReadAndWriteState extends State<ReadAndWrite> {
  String? _content;

  Future<String> _getDirPath() async {
    final dir =
        await getApplicationDocumentsDirectory(); //the function finds the documents folder
    return dir.path;
  }

  Future<void> _readData() async {
    final dirPath = await _getDirPath();
    final file = File('$dirPath/data.txt');

    final data = await file.readAsString(encoding: utf8);
    setState(() {
      _content = data; //the content will be displayed
    });
  }

  final _textController = TextEditingController();
  Future<void> _writeData() async {
    final dirPath = await _getDirPath();
    final file = File('$dirPath/data.txt');

    await file.writeAsString(_textController.text);
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Display text'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: const InputDecoration(labelText: 'Enter some text'),
            ),
            ElevatedButton(
              onPressed: _writeData,
              child: const Text('Save it to file'),
            ),
            const SizedBox(height: 150),
            Text(_content ?? 'Press the button to see the text!',
                style: const TextStyle(fontSize: 24)),
            ElevatedButton(
              onPressed: _readData,
              child: const Text('Read from file'),
            ),
          ],
        ),
      ),
    );
  }
}
