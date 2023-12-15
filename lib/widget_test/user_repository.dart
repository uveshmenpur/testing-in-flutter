import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testing_in_flutter/widget_test/user_model.dart';

class UserRepository {
  Future<List<User>> fetchUsers() async {
    final response = await http.get(
      Uri.parse(
        'https://jsonplaceholder.typicode.com/users',
      ),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch users');
    }
  }
}
