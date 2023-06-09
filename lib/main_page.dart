import 'package:example/animation/rotating/animation_home.dart';
import 'package:example/animation/staggered/stagger_demo.dart';
import 'package:example/cards_listing/list_page.dart';
import 'package:example/color_changes/color_changer.dart';
import 'package:example/hive_db/shopping_box.dart';
import 'package:example/stream/number_screen.dart';
import 'package:example/game/tic_tac.dart';
import 'package:example/providers/counter_provider/counter_provider.dart';
import 'package:example/providers/counter_provider/counter_a_page.dart';
import 'package:example/providers/counter_provider/counter_b_page.dart';
import 'package:example/read_and_write_txt/read_write.dart';
import 'package:example/providers/text_provider/text_input.dart';
import 'package:example/providers/text_provider/text_provider.dart';
import 'package:example/stream/crypto_stream.dart';
import 'package:example/timer/view/timer_page.dart';
import 'package:example/todo_list/todo_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'converter/length_converter.dart';
import 'get_image_size/image_size.dart';
import 'users_listing/list_from_api.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late MyCounter myCounterProvider;
  late TextProvider textProvider;

  @override
  void dispose() {
    myCounterProvider.dispose();
    textProvider.dispose();
    super.dispose();
  }

  @override
  void initState() {
    myCounterProvider = MyCounter();
    textProvider = TextProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyCounter>(create: (_) {
          myCounterProvider = MyCounter();
          return myCounterProvider;
        }),
        ChangeNotifierProvider<TextProvider>(create: (_) {
          textProvider = TextProvider();
          return textProvider;
        }),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text('Choose a page!'),
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
            ListTile(
              title: const Text('Enter your name'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider.value(
                      value: textProvider,
                      builder: (context, child) => const TextInput(),
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Make a todo list!'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TodoList(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text("Get an image's size"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ImageSize(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text("Save a text to a txt"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ReadAndWrite(),
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
                    builder: (context) => const AnimationHome(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Show streamed user'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CryptoStream(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Play a game!'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TicTac(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Convert!'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Converter(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Count!'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NumberScreen(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Set the timer!'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TimerPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('See the database!'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShoppingBox(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
