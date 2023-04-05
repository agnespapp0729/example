import 'package:example/cards_listing/card_factory.dart';
import 'package:flutter/material.dart';
import '../model/card.dart';

class CardList extends StatefulWidget {
  const CardList({super.key});

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  List<Quote> quotes = [
    Quote(
        text: 'Be yourself; everyone else is already taken',
        author: 'Oscar Wilde'),
    Quote(
        author: 'Oscar Wilde',
        text: 'I have nothing to declare except my genius'),
    Quote(
        author: 'Oscar Wilde',
        text: 'The truth is rarely pure and never simple')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        title: const Text("Awesome quotes"),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: [
          Column(
            children: quotes.map((quote) => CardFactory(quote: quote)).toList(),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: ElevatedButton.icon(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
              label: const Text("Go back"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
