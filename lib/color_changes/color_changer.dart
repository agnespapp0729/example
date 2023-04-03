import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
        title: Text('Change every color!'),
      ),
      body: Container(
        color: containerColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => setState(() => pressButton = !pressButton),
                child: Text('Change my color'),
                style: ButtonStyle(
                  backgroundColor: pressButton
                      ? MaterialStateProperty.all(Colors.black)
                      : MaterialStateProperty.all(Colors.pink),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    containerColor = Colors.yellow;
                  });
                },
                child: Text('Change page color'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.amber),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
