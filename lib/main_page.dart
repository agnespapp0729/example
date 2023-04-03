import 'package:example/animation/stagger_demo.dart';
import 'package:example/cards_listing/list_page.dart';
import 'package:example/color_changes/color_changer.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'users_listing/list_from_api.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Flutter ListView Navigation I'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Card list'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CardList(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('User listing from api'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserList(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Animation'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StaggerDemo(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Change colors!'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ColorChanger(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
