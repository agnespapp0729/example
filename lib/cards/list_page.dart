import 'package:example/cards/card_factory.dart';
import 'package:flutter/material.dart';
import 'card.dart';

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
      appBar: AppBar(
        title: Text("Awesome quotes"),
      ),
      body: Column(
        children: quotes.map((quote) => CardFactory(quote: quote)).toList(),
      ),
    );
  }
}
