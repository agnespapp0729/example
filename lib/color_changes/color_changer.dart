import 'package:flutter/material.dart';

class ColorChanger extends StatefulWidget {
  const ColorChanger({super.key});

  @override
  State<ColorChanger> createState() => _ColorChangerState();
}

class _ColorChangerState extends State<ColorChanger> {
  Color containerColor = Colors.white;
  bool pressButton = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Change every color!'),
      ),
      body: Container(
        color: containerColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => setState(() => pressButton = !pressButton),
                style: ButtonStyle(
                  backgroundColor: pressButton
                      ? MaterialStateProperty.all(Colors.black)
                      : MaterialStateProperty.all(Colors.pink),
                ),
                child: const Text('Change my color'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    containerColor = Colors.yellow;
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.amber),
                ),
                child: const Text('Change page color'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
