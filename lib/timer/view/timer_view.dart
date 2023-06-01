import 'package:example/timer/view/background.dart';
import 'package:example/timer/view/timer_text.dart';
import 'package:example/timer/view/actions.dart';
import 'package:flutter/material.dart';

class TimerView extends StatelessWidget {
  const TimerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Timer"),
      ),
      body: const Stack(
        children: [
          Background(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 60),
                child: Center(child: TimerText()),
              ),
              ActionButtons(),
            ],
          ),
        ],
      ),
    );
  }
}
