import 'dart:async';
import 'dart:convert';

import 'package:example/model/crypto_user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CryptoStream extends StatefulWidget {
  const CryptoStream({super.key});

  @override
  State<CryptoStream> createState() => _CryptoStreamState();
}

class _CryptoStreamState extends State<CryptoStream> {
  final StreamController<CryptoUser> _streamController = StreamController();

  @override
  void dispose() {
    super.dispose();
    //close the stream when the app stops
    _streamController.close();
  }

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 3), (timer) {
      getCryptoData();
    });
  }

  //fetch data from an API
  Future<void> getCryptoData() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/users/10");

    final response = await http.get(url);
    final databody = json.decode(response.body);

    CryptoUser cryptoUser = CryptoUser.fromJson(databody);

    _streamController.sink.add(cryptoUser);
  }

  Widget buildCoinWidget(CryptoUser cryptoUser) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${cryptoUser.name}',
            style: const TextStyle(fontSize: 25),
          ),
          const SizedBox(height: 20),
          Text(
            '${cryptoUser.email}',
          ),
          const SizedBox(height: 20),
          Text(
            '${cryptoUser.phoneNumber}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Streamed data from API'),
      ),
      body: Center(
        child: StreamBuilder<CryptoUser>(
          stream: _streamController.stream,
          builder: (context, snapdata) {
            switch (snapdata.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              default:
                if (snapdata.hasError) {
                  return const Text('Please wait...');
                } else {
                  return buildCoinWidget(snapdata.data!);
                }
            }
          },
        ),
      ),
    );
  }
}
