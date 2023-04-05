import 'package:flutter/material.dart';

import '../model/card.dart';

class CardFactory extends StatelessWidget {
  const CardFactory({
    Key? key,
    required this.quote,
  }) : super(key: key);

  final Quote quote;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              quote.text,
              style: const TextStyle(
                color: Colors.amber,
              ),
            ),
            const SizedBox(height: 6.0),
            Text(
              quote.author,
              style: const TextStyle(
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
