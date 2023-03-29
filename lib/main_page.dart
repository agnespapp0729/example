import 'package:example/cards_listing/list_page.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'users_listing/list_from_api.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Color containerColor = Colors.white;
  bool pressButton = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Go back to the home page'),
      ),
      body: Container(
        color: containerColor,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CardList()),
                );
              },
              child: Text('Go to list page'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.purpleAccent),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserList()),
                );
              },
              child: Text('Go to list_from_api page'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.purpleAccent),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
