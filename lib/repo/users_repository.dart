import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_flutter/model/users_model.dart';

class UsersRepository {
  Future<Users> searchUser(String username) async {
    var url = Uri.parse(
        'https://api.github.com/search/users?q=$username&per_page=10&token=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');
    var response = await http.get(url);

    try {
      return Users.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw Exception(e);
    }
  }
}
