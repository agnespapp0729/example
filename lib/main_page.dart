import 'package:example/animation/stagger_demo.dart';
import 'package:example/cards_listing/list_page.dart';
import 'package:example/color_changes/color_changer.dart';
import 'package:example/counter_provider/counter_notifier.dart';
import 'package:example/counter_provider/counter_a_page.dart';
import 'package:example/counter_provider/counter_b_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'users_listing/list_from_api.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late MyCounter myCounterProvider;
  @override
  void dispose() {
    myCounterProvider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyCounter(),
      builder: (context, _) {
        myCounterProvider = Provider.of<MyCounter>(context);

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
                      builder: (context) => const CardList(),
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
                      builder: (context) => const UserList(),
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
                      builder: (context) => const StaggerDemo(),
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
                      builder: (context) => const ColorChanger(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Increase counter'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider.value(
                        value: myCounterProvider,
                        builder: (context, child) => const CounterB(),
                      ),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Decrease counter'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider.value(
                        value: myCounterProvider,
                        builder: (context, child) => const CounterA(),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
