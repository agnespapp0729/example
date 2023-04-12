import 'package:example/model/users.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  final String apiUrl = "https://jsonplaceholder.typicode.com/users";

  Future<List<GetUserFromJson>> fetchData() async {
    var jsonResponse = await get(Uri.parse(apiUrl));

    if (jsonResponse.statusCode == 200) {
      final jsonItems =
          json.decode(jsonResponse.body).cast<Map<String, dynamic>>();

      List<GetUserFromJson> usersList = jsonItems.map<GetUserFromJson>((json) {
        return GetUserFromJson.fromJson(json);
      }).toList();

      return usersList;
    } else {
      throw Exception('Failed to load data from internet');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User's data"),
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.black,
      ),
      body: FutureBuilder<List<GetUserFromJson>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView(
            children: snapshot.data!
                .map((user) => ListTile(
                      title: Text(user.name),
                      onTap: () {
                        // ignore: avoid_print
                        print(user.name);
                      },
                      subtitle: Text(user.phoneNumber),
                      leading: CircleAvatar(
                        backgroundColor: Colors.amberAccent,
                        child: Text(
                          user.name[0],
                          style: const TextStyle(
                              color: Colors.black, fontSize: 20.0),
                        ),
                      ),
                    ))
                .toList(),
          );
        },
      ),
    );
  }
}
