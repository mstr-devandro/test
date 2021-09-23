import 'package:http/http.dart' as http;
import 'package:test_flutter/model/users.dart';

class UsersRepository {
  Future<Users> getUser(String username) async {
    var url =
        Uri.parse('https://api.github.com/search/users?q=$username&per_page=3');
    var response = await http.get(url);

    try {
      print(response.body);
      return usersFromJson(response.body);
    } catch (e) {
      throw Exception(e);
    }
  }
}
