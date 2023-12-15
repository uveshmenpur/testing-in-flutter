import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:testing_in_flutter/unit_test/user_model.dart';
import 'package:testing_in_flutter/widget_test/user_repository.dart' as widget_test;
import 'package:testing_in_flutter/unit_test/user_repository.dart' as unit;
import 'package:testing_in_flutter/widget_test/home_screen_user.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Testing App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreenUser(
      futureUsers: widget_test.UserRepository().fetchUsers(),
      ),
      /// Widget test Counter App
      // home: const MyHomePage(title: 'Widget Test'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<User> getUsers = unit.UserRepository(Client()).getUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unit Test'),
      ),
      body: FutureBuilder(
        future: getUsers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Center(
            child: Text(
              '${snapshot.data}',
            ),
          );
        },
      ),
    );
  }
}
